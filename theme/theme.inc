<?php

/**
 * @file
 * Handles the display of EAD objects.
 *
 * This file is part of the Islandora EAD Solution Pack.
 * Copyright (C) 2015  Drexel University.
 *
 * The Islandora EAD Solution Pack is free software; you can redistribute
 * it and/or modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 *
 * The Islandora EAD Solution Pack is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with The Islandora EAD Solution Pack; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/**
 * Implements template_preprocess_HOOK().
 */
function islandora_ead_preprocess_islandora_ead(&$variables) {
  // Add print css
  drupal_add_css(drupal_get_path('module', 'islandora_ead') . '/css/print.css', array('every_page' => false, 'media' => 'print'));

  // Build page content
  $object = $variables['object'];
  $narrative = '';

  module_load_include('inc', 'islandora_ead', 'includes/utilities');
  $associated_objs = islandora_ead_retrieve_associations($object->id);

  if (isset($object['EAD'])) {
    try {
      $xsl = new DOMDocument();
      if ($xsl->load(drupal_get_path('module', 'islandora_ead') . '/xml/islandora_eadToHTML.xsl') === FALSE) {
        throw new Exception('Error loading EAD XSLT');
      }

      $xslt = new XSLTProcessor();
      if ($xslt->importStyleSheet($xsl) === FALSE) {
        throw new Exception('Error importing XSLT');
      }

      $object_actual_dom = new DOMDocument();
      $object_actual_dom->preserveWhiteSpace = FALSE;
      if ($object_actual_dom->loadXML($object['EAD']->content) === FALSE) {
        throw new Exception('Error loading EAD XML');
      }
      $object_actual_dom = $xslt->transformToDoc($object_actual_dom);
      if ($object_actual_dom === FALSE) {
        throw new Exception('Error transforming EAD');
      }
      $transformed_xml = simplexml_import_dom($object_actual_dom);
      if ($transformed_xml  === FALSE || $transformed_xml  === NULL) {
        throw new Exception('Error making SimpleXML');
      }

      $xpath = new DOMXpath($object_actual_dom);
      if (!$xpath) {
        throw new Exception('Error making DOMXPath');
      }

      foreach ($associated_objs as $levelid => $pid) {
        $elements = $xpath->query("//*[@id='$levelid']");

        foreach ($elements as $element) {
          if ($element->childNodes->length > 0) {
            $href = $object_actual_dom->createElement('a');
            $href->setAttribute('href', "/islandora/object/$pid");
            $href->setAttribute('class', "hasPopover");

            $child_node = $element->childNodes->item(0);
            $sibling_node = $child_node->nextSibling;

            $element->removeChild($child_node);
            $href->appendChild($child_node);
            if ($sibling_node === NULL) {
              $element->appendChild($href);
            }
            else {
              $element->insertBefore($href, $sibling_node);
            }
          }
        }
      }
      $narrative = $transformed_xml->asXML();
    }
    catch (Exception $e) {
      $narrative = t("Something is wrong with the EAD: @message", array("@message" => $e->getMessage()));
    }
  }
  else {
    $narrative = 'No EAD available';
  }

  $content = array();
  $content['narrative'] = $narrative;

  $variables['content'] = $content;
}
