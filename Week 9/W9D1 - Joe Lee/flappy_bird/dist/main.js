/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/bird.js":
/*!*********************!*\
  !*** ./src/bird.js ***!
  \*********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Bird)\n/* harmony export */ });\n/* harmony import */ var _constants__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./constants */ \"./src/constants.js\");\n\nclass Bird {\n  constructor(dimensions) {\n    this.velocity = 0;\n    this.y = dimensions.height / 2;\n    this.x = dimensions.width * 0.3;\n\n  }\n\n  drawBird(context) {\n    \n    context.fillStyle = 'yellow';\n    context.fillRect(this.x, this.y, _constants__WEBPACK_IMPORTED_MODULE_0__.default.BIRD_WIDTH, _constants__WEBPACK_IMPORTED_MODULE_0__.default.BIRD_HEIGHT);\n  }\n\n  animate(context) {\n    this.drawBird(context);\n  }\n\n  flap() {\n    this.velocity = _constants__WEBPACK_IMPORTED_MODULE_0__.default.FLAP_SPEED;\n  }\n\n  move() {\n\n    // velocity = -8,\n    // Gravity = 0.8\n    this.y += this.velocity + _constants__WEBPACK_IMPORTED_MODULE_0__.default.GRAVITY;\n    this.velocity += 0.3;\n    if (this.velocity >= _constants__WEBPACK_IMPORTED_MODULE_0__.default.TERMINAL_VEL) {\n      this.velocity = _constants__WEBPACK_IMPORTED_MODULE_0__.default.TERMINAL_VEL;\n    }\n  }\n\n}\n\n// Frame 1\n   // velocity = 0,\n    // Gravity = 0.8\n    // y = 0\n\n    // Frame 2\n   // velocity = 0,\n    // Gravity = 0.8\n    // y = 0.8\n\n    // Frame 3\n   // velocity = -8,\n    // Gravity = 0.8\n    // y = -7.2\n\n    // Frame 4\n   // velocity = -7.8,\n    // Gravity = 0.8\n    // y = -15\n\n    // Frame 5\n   // velocity = -7.6,\n    // Gravity = 0.8\n    // y = 0\n\n    // Frame 6\n   // velocity = -7.8,\n    // Gravity = 0.8\n    // y = 0\n\n\n//# sourceURL=webpack:///./src/bird.js?");

/***/ }),

/***/ "./src/constants.js":
/*!**************************!*\
  !*** ./src/constants.js ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({\n    GRAVITY:  0.8,\n    FLAP_SPEED:  -8,\n    TERMINAL_VEL:  12,\n    BIRD_WIDTH:  40,\n    BIRD_HEIGHT:  30,\n    PIPE_GAP: 220,\n    OPENING_GAP: 150,\n    SCROLL_SPEED: -0.5\n});\n\n\n//# sourceURL=webpack:///./src/constants.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ FlappyBird)\n/* harmony export */ });\n/* harmony import */ var _level__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./level */ \"./src/level.js\");\n/* harmony import */ var _bird__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./bird */ \"./src/bird.js\");\n\n\n\nclass FlappyBird {\n  constructor(canvas){\n    \n    this.ctx = canvas.getContext(\"2d\");\n    this.dimensions = { width: canvas.width, height: canvas.height };\n    this.bird = new _bird__WEBPACK_IMPORTED_MODULE_1__.default(this.dimensions);\n    this.level = new _level__WEBPACK_IMPORTED_MODULE_0__.default(this.dimensions);\n\n    canvas.addEventListener('click', () => this.bird.flap())\n  }\n\n  animate(running) {\n    if (running) {\n      \n      this.level.animate(this.ctx);\n\n      this.bird.move();\n      this.bird.animate(this.ctx);\n      requestAnimationFrame(() => this.play());\n    } else {\n      requestAnimationFrame(() => this.restart());\n    }\n  }\n\n  restart() {\n    this.level = new _level__WEBPACK_IMPORTED_MODULE_0__.default(this.dimensions);\n    this.bird = new _bird__WEBPACK_IMPORTED_MODULE_1__.default(this.dimensions);\n    \n    this.running = false;\n    this.animate(this.running);\n  }\n\n  play() {\n    \n    this.running = true;\n    this.animate(this.running);\n  }\n\n}\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _game__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\n\nconst canvas = document.getElementById('bird-game');\nconst game = new _game__WEBPACK_IMPORTED_MODULE_0__.default(canvas);\ngame.play();\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/level.js":
/*!**********************!*\
  !*** ./src/level.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Level)\n/* harmony export */ });\n/* harmony import */ var _constants__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./constants */ \"./src/constants.js\");\n\n\nclass Pipe {\n  constructor(x, y) {\n    this.x = x;\n    this.y = y;\n  }\n\n  drawPipe(ctx) {\n    ctx.fillStyle = \"red\";\n    ctx.fillRect(this.x, this.y, 20, 100);\n  }\n\n  animate(ctx) {\n    this.move();\n    this.drawPipe(ctx);\n  }\n\n  move() {\n    this.x += _constants__WEBPACK_IMPORTED_MODULE_0__.default.SCROLL_SPEED;\n  }\n\n}\n\n\nclass Level {\n  constructor(dimensions) {\n    this.dimensions = dimensions;\n    this.pipes = [];\n    this._createPipe();\n  }\n\n  _createPipe() {\n    let startPos = 0;\n    for (let i = 0; i < 3; i++) {\n      this.pipes.push(new Pipe(startPos, 0))\n      startPos += _constants__WEBPACK_IMPORTED_MODULE_0__.default.PIPE_GAP\n    }\n  }\n\n  drawBackground(ctx) {\n    ctx.fillStyle = \"skyblue\";\n    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);\n  }\n\n  animate(ctx) {\n    this.drawBackground(ctx);\n    if (this.pipes[0].x < 0) {\n      this.pipes.shift();\n      this.pipes.push(new Pipe(this.dimensions.width, 0))\n    }\n    this.pipes.forEach(pipe => pipe.animate(ctx))\n  }\n}\n\n//# sourceURL=webpack:///./src/level.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;