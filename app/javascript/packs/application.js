import React from "react"
import ReactDom from "react-dom"
import StringAddition from "../components/StringAddition"

document.addEventListener("DOMContentLoaded", () => {
  ReactDom.render(<StringAddition />, document.body.appendChild(document.createElement('div')));
});
