// Generated by CoffeeScript 1.3.3
(function() {

  define(["aloha", "aloha/plugin", "block/block", "block/blockmanager"], function(Aloha, Plugin, block, BlockManager) {
    /*
       register the plugin with unique name
    */
    return Plugin.create("figure", {
      init: function() {
        var EditableImageBlock;
        EditableImageBlock = block.AbstractBlock.extend({
          title: 'Image',
          getSchema: function() {
            return {
              'image': {
                type: 'string',
                label: 'Image URI'
              },
              'position': {
                type: 'select',
                label: 'Position',
                values: [
                  {
                    key: '',
                    label: 'No Float'
                  }, {
                    key: 'left',
                    label: 'Float left'
                  }, {
                    key: 'right',
                    label: 'Float right'
                  }
                ]
              }
            };
          },
          init: function($element, postProcessFn) {
            this.attr('image', $element.find('img').attr('src'));
            return postProcessFn();
          },
          update: function($element, postProcessFn) {
            if (this.attr('position') === 'right') {
              $element.css('float', 'right');
            } else if (this.attr('position') === 'left') {
              $element.css('float', 'left');
            } else {
              $element.css('float', '');
            }
            $element.find('img').attr('src', this.attr('image'));
            return postProcessFn();
          },
          createEditablesIfNeeded: function() {
            return this.$element.find('figcaption').addClass('aloha-editable').contentEditable(true);
          }
        });
        return BlockManager.registerBlockType('EditableImageBlock', EditableImageBlock);
      },
      /*
           toString method
      */

      toString: function() {
        return "figure";
      }
    });
  });

}).call(this);
