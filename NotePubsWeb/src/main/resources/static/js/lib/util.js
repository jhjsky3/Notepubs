var CSS = {};
CSS.set = function(element, attrs){
    for(var key in attrs)
        element.style[key] = attrs[key];
}

export default CSS;