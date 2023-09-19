import React from 'react';
import './Footer.css';

function Footer() {
  return (
    <footer className="footer">
        <div className="footer-content">
            <ul>
                <li id="title">Come visit me on:</li>
                <li>
                    <a href="https://www.linkedin.com">LinkedIn</a>
                </li>
                <li>
                    <a href="https://www.github.com">GitHub</a>
                </li>
                <li>
                    <a href="https://www.wellfound.com">Wellfound</a>
                </li>
                <li>&copy; 2023 Tablr</li>
            </ul>
        </div>
    </footer>
  );
}

export default Footer;