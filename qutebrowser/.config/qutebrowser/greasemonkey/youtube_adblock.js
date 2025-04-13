// // ==UserScript==
// // @name         YouTube Ad Blocker
// // @namespace    http://tampermonkey.net/
// // @version      1.3
// // @description  Blocks ads on YouTube
// // @author       NikMods
// // @license      MIT
// // @match        https://www.youtube.com/*
// // @grant        none
// // @downloadURL https://update.greasyfork.org/scripts/489265/YouTube%20Ad%20Blocker.user.js
// // @updateURL https://update.greasyfork.org/scripts/489265/YouTube%20Ad%20Blocker.meta.js
// // ==/UserScript==
//
// /*
// MIT License
//
// Copyright (c) 2022 [NikMods]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// */
//
// (function() {
//     'use strict';
//
//     // Function to hide ads on YouTube
//     function hideYouTubeAds() {
//         const adSelectors = [
//             '.ytp-ad-module', 
//             '.ad-showing', 
//             '.ytp-ad-player-overlay',
//             '.video-ads',
//             '#player-ads',
//             'ytd-promoted-sparkles-text-search-renderer',
//             'ytd-promoted-sparkles-web-renderer',
//             'ytd-display-ad-renderer'
//         ];
//
//         adSelectors.forEach(selector => {
//             document.querySelectorAll(selector).forEach(ad => {
//                 ad.style.display = 'none'; // Hide the ad
//             });
//         });
//
//         // Remove any remaining video ads
//         const videoAd = document.querySelector('.video-ads');
//         if (videoAd) {
//             videoAd.innerHTML = ''; // Remove the ad content
//             videoAd.style.display = 'none'; // Hide the container
//         }
//     }
//
//     // Execute ad blocking when the page is fully loaded
//     window.addEventListener('load', hideYouTubeAds);
//     window.addEventListener('scroll', hideYouTubeAds);
//
//     // Regularly check for new ads
//     setInterval(hideYouTubeAds, 1000);
//
//     // Add support for YouTube Shorts and other dynamic elements
//     const observer = new MutationObserver(hideYouTubeAds);
//     observer.observe(document.body, { childList: true, subtree: true });
// })();
