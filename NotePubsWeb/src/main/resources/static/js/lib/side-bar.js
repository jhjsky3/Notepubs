
import CSS from '../lib/util.js';

export default class SideBar{
    constructor(selector){
        this.dom = document.querySelector(selector);
        this.screen = document.createElement("div");
        CSS.set(screen, {
            position: "fixed",
            width: "100%",
            height: "100%",
            background: "#000",
            opacity: "0.5",
            zIndex: "500"
        });
    }
    open(){
        alert("open");
    }
    close(){
        alert("close");
    }
}

