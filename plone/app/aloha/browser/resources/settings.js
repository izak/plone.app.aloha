(function(window, undefined){  

    if (window.Aloha === undefined || window.Aloha === null) { 
        var Aloha = window.Aloha = {};
    }
    
    Aloha.settings = {
        jQuery: window.jQuery,
        plugins: {
            format: {
                config : ['b', 'i', 'p', 'sub', 'sup', 'del', 'title', 'h2', 'h3', 'pre', 'removeFormat']
            }
        }
    };
})(window);
