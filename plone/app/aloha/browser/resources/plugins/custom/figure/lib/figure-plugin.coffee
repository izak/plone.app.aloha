define [ "aloha", "aloha/plugin", "block/block", "block/blockmanager" ], (Aloha, Plugin, block, BlockManager) -> 
  ###
   register the plugin with unique name
  ###
  Plugin.create "figure",
    init: ->
      EditableImageBlock = block.AbstractBlock.extend
        title: 'Image'
        getSchema: () ->
          'image':
            type: 'string'
            label: 'Image URI'
          'position':
            type: 'select'
            label: 'Position'
            values: [{
              key: ''
              label: 'No Float'
            }, {
              key: 'left'
              label: 'Float left'
            }, {
              key: 'right'
              label: 'Float right'
            }]
        init: ($element, postProcessFn) ->
          this.attr('image', $element.find('img').attr('src'))
          postProcessFn()
        update: ($element, postProcessFn) ->
          if this.attr('position') == 'right'
            $element.css 'float', 'right'
          else if this.attr('position') == 'left'
            $element.css 'float', 'left'
          else
            $element.css 'float', ''
    
          $element.find('img').attr('src', this.attr('image'))
          postProcessFn()

        createEditablesIfNeeded: () ->
          this.$element.find('figcaption').addClass('aloha-editable').contentEditable(true);

      BlockManager.registerBlockType('EditableImageBlock', EditableImageBlock)


    ###
     toString method
    ###
    toString: ->
      "figure"
