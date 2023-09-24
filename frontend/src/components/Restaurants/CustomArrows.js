import React from 'react';

export const CustomPrevArrow = (props) => (
    <div
        className="custom-arrow custom-prev-arrow"
        onClick={props.onClick}
        style={{ zIndex: 1 }}
    >
        &lt; {/* Left arrow */}
    </div>
);

export const CustomNextArrow = (props) => (
    <div
        className="custom-arrow custom-next-arrow"
        onClick={props.onClick}
        style={{ zIndex: 1 }}
    >
        &gt; {/* Right arrow */}
    </div>
);