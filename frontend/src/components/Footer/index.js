import React from 'react';
import './Footer.css';

function Footer() {
  return (
    <footer className="footer">
        <div class="footer-content">
            <ul>
                <li><a href="/about">About Us</a></li>
                <li><a href="/contact">Contact</a></li>
                <li><a href="/privacy-policy">Privacy Policy</a></li>
            </ul>
            <p>&copy; 2023 Tablr</p>
        </div>
    </footer>
  );
}

export default Footer;