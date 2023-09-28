import React from 'react';
import SearchBar from './Search';
import './Search.css';

function SearchBanner() {
    return (
        <>
            <div className='search-header'>
                <h1>Where will Tablr take you tonight?</h1>
                <SearchBar />
            </div>
        </>
    )
}

export default SearchBanner;