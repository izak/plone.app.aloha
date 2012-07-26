define [ "aloha", "aloha/plugin", "block/block", "block/blockmanager" ], (Aloha, Plugin, block, BlockManager) -> 


  ###
   Monkey patch a couple of things in Aloha so figures can be draggable blocks
  ###
  block.AbstractBlock.prototype._postProcessElementIfNeeded = () ->
    @createEditablesIfNeeded()
    @_checkThatNestedBlocksAreStillConsistent()
    @_makeNestedBlockCollectionsSortable()

    @renderBlockHandlesIfNeeded();
    if (@isDraggable() and @$element[0].tagName.toLowerCase() == 'span')
      @_setupDragDropForInlineElements()
      @_disableUglyInternetExplorerDragHandles()
    #  PHIL Hack so figures are treated like DIV's (the next line is changed)
    else if (@isDraggable())
      this._setupDragDropForBlockElements()
      this._disableUglyInternetExplorerDragHandles()

  BlockManager._blockify = (element, instanceDefaults) ->
    $element = jQuery(element)

    tagName = $element[0].tagName.toLowerCase()
    #if (tagName != 'span' and tagName != 'div')
      # PHIL Aloha.Log.error('block/blockmanager', 'Blocks can only be created from <div> or <span> element. You passed ' + tagName + '.');
      # PHIL return;

    attributes = @getConfig($element, instanceDefaults)

    if (not @blockTypes.has(attributes['aloha-block-type']))
      Aloha.Log.error('block/blockmanager', 'Block Type ' + attributes['aloha-block-type'] + ' not found!')
      return

    block = new (@blockTypes.get(attributes['aloha-block-type']))($element)
    block.$element.addClass('aloha-block-' + attributes['aloha-block-type'])
    jQuery.each(attributes, (k, v) ->
      block._setAttribute(k, v)
    )

    # Register block
    @blocks.register(block.getId(), block)


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
