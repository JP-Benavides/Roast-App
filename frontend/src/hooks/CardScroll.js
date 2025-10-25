import { useState, useEffect, useRef, useCallback } from 'react';


export const loadCardData = (bounds) => {

    try{
       const resp = await fetch(`/api/coffeeshops/map?north=${bounds.north}&south=${bounds.south}&east=${bounds.east}&west=${bounds.west}`);
       if(!resp.ok){
        console.log(resp);
        return; 
       }
       


    }




};
