// 浅拷贝
function clone(origin, target) {
  var target = target || {}
  for (var key in origin) {
    if (origin.hasOwnProperty(key)) {
      target[key] = origin[key]
    }
  }
  return target
}

// 深拷贝
function deepClone(origin, target) {
  var target = target || {},
    toStr = Object.prototype.toString
  for (var key in origin) {
    if (origin.hasOwnProperty(key)) {
      if (typeof origin[key] === "object" && origin[key] !== null) {
        if (toStr.call(origin[key]) === "[object Array]") {
          target[key] = []
        } else {
          target[key] = {}
        }
        deepClone(origin[key], target[key])
      } else {
        target[key] = origin[key]
      }
    }
  }
  return target
}

// DOM事件添加
function addEvent(el, type, fn) {
  if (el.addEventListener) {
    el.addEventListener(type, fn, false) //true 事件捕获  false 事件冒泡
  } else if (el.attachEvent) {
    el.attachEvent("on" + type, function () {
      fn.call(el) //改变this指向
    })
  } else {
    el["on" + type] = fn
  }
}

// DOM事件移除
function removeEvent(elem, type, fn) {
  if (elem.addEventListener) {
    elem.removeEventListener(type, fn, false) //解除绑定
  } else if (elem.attachEvent) {
    elem.detachEvent("on" + type, fn)
  } else {
    elem["on" + type] = null
  }
}

// 阻止事件冒泡
function cancelBubble(e) {
  var e = e || window.event
  if (e.stopPropagetion()) {
    e.stopPropagetion()
  } else {
    e.cancelBubble = true
  }
}
function preventDefaultEvent(e) {
  var e = e || window.event
  if (e.preventDefault) {
    event.preventDefault()
  } else {
    event.returnValue = false
  }
}

// 封装：pageX  鼠标位置相对于当前文档的坐标 = 滚动条距离 + 与当前可视区域的坐标 -文档偏移距离
function pagePos(e) {
  //滚动条距离
  var sLeft = getScrollOffset().left,
    sTop = getScrollOffset().top,
    // 偏移距离
    cLeft = document.documentElement.clientLeft || 0,
    cTop = document.documentElement.clientTop || 0
  return {
    X: e.clientX + sLeft - cLeft,
    Y: e.clientY + sTop - cTop,
  }
}

// 封装滚动条
function getScrollOffset() {
  if (window.pageXOffset) {
    return {
      left: window.pageXOffset,
      top: window.pageYOffset,
    }
  } else {
    return {
      left: document.body.scrollLeft + document.documentElement.scrollLeft,
      top: document.body.scrollTop + document.documentElement.scrollTop,
    }
  }
}

// 浏览器可视区域尺寸
function getViewportSize() {
  if (window.innerWidth) {
    return {
      width: window.innerWidth,
      height: window.innerHeight,
    }
  } else {
    if (document.compatMode === "BackCompat") {
      return {
        width: document.body.clientWidth,
        height: document.body.clientHeight,
      }
    } else {
      return {
        width: document.documentElement.clientWidth,
        height: document.documentElement.clientHeight,
      }
    }
  }
}

// 滚动距离
function getScrollSize() {
  if (document.body.scrollWidth) {
    return {
      width: document.body.scrollWidth,
      height: document.body.scrollHeight,
    }
  } else {
    return {
      width: document.documentElement.scrollWidth,
      height: document.documentElement.scrollHeight,
    }
  }
}

// 查看元素的计算样式
function getStyles(elem, prop) {
  if (window.getComputedStyle) {
    if (prop) {
      return window.getComputedStyle(elem, null)[prop]
      // null 可以填写伪元素'after'
    } else {
      return window.getComputedStyle(elem, null)
    }
  } else {
    if (prop) {
      return elem.currentStyle[prop]
    } else {
      return elem.currentStyle
    }
  }
}

// 封装拖拽函数
function elemDrag(elem) {
  var x, y
  addEvent(elem, "mousedown", function (e) {
    var e = e || window.event
    x = pagePos(e).X - parseInt(getStyles(elem, "left"))
    y = pagePos(e).Y - parseInt(getStyles(elem, "top"))
    addEvent(document, "mousemove", mouseMove)
    addEvent(document, "mouseup", mouseUp)
    cancelBubble(e)
    preventDefaultEvent(e)
  })

  function mouseMove(e) {
    var e = e || window.event
    elem.style.left = pagePos(e).X - x + "px"
    elem.style.top = pagePos(e).Y - y + "px"
  }

  function mouseUp(e) {
    var e = e || window.evemt
    removeEvent(document, "mousemove", mouseMove)
    var e = e || window.evemt
    removeEvent(document, "mouseup", mouseUp)
  }
}
