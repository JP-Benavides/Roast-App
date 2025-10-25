import { Zap } from 'lucide-react';
import { useState, useEffect, useRef, useCallback } from 'react';



export const loadCardData = (bounds) => {
    const [cards, updateCards] = useState([]); 

    //get data from paginated api
    const getData = useCallback(async () => {
        try{
        const resp = await fetch(`/api/coffeeshops/map?north=${bounds.north}&south=${bounds.south}&east=${bounds.east}&west=${bounds.west}`);
        if(!resp.ok){
            console.log(resp);
            return; 
        }
        const data = await resp.json(); 
        return data; 
        }
        catch{
            console.log("error in API")
        }
    }, [])

    
};
