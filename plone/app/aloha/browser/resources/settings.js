(function(window, undefined){  

    if (window.Aloha === undefined || window.Aloha === null) { 
        var Aloha = window.Aloha = {};
    }
    
    Aloha.settings = {
        jQuery: window.jQuery,
        plugins: {
            format: {
                config : ['b', 'i', 'p', 'sub', 'sup', 'del', 'title', 'h2', 'h3', 'pre', 'removeFormat']
            },
            block: {
                defaults: {
                    '.default-block': { 
                    }, 
                    'figure': {
                        'aloha-block-type': 'EditableImageBlock'
                    },
                    '.figure': {
                        'aloha-block-type': 'EditableImageBlock'
                    }
                }
            }
        }
    };
})(window);

Aloha.settings.plugins = {
  block: {
  }
}

