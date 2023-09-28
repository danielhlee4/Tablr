import React from 'react';
import SearchBar from './Search';
import './Search.css';

function SearchBanner() {
    return (
        <>
            <div className='search-header'>
                <h1>Find your table for any occasion</h1>
                <SearchBar />
            </div>
        </>
    )
}

export default SearchBanner;