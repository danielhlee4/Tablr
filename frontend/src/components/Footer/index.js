import React from 'react';
import './Footer.css';

function Footer() {
  return (
    <footer className="footer">
        <div className="footer-content">
            <ul>
                <li id="title">Come visit me on:</li>
                <li>
                    <a href="https://www.linkedin.com/in/danlee-/" target="_blank">LinkedIn</a>
                </li>
                <li>
                    <a href="https://github.com/danielhlee4" target="_blank">GitHub</a>
                </li>
                <li>
                    <a href="https://wellfound.com/u/daniel-lee-300" target="_blank">Wellfound</a>
                </li>
                <li>&copy; 2023 Tablr</li>
            </ul>
        </div>
    </footer>
  );
}

export default Footer;