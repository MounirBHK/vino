import React from "react";
import axios from "axios";
import { useState, useRef, useEffect  } from "react";


function FormAjoutCellier() {

    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const [libelle, setLibelle] = useState('');
    const [colonnes, setColonnes] = useState('');
    const [lignes, setLignes] = useState('');
    const [capacite, setCapacite] = useState('');
    
    const putNewCellier = async (newCellier) => {
        // console.log(newCellier);
        return await axios.post(hostOriginURL + "/api/ajouterCellier", newCellier,
        {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            const newCellier = {
                id_user:userId,
                lib_cellier:libelle, 
                nbr_colonne:parseInt(colonnes), 
                nbr_ligne:parseInt(lignes), 
                capacite:parseInt(capacite)
                
                //date:date
            }
            // console.log(newCellier);
            
            putNewCellier(newCellier)
            .then(response => {
                console.log(response);
            }
        
            );
         
        }

    }


    return (
        
        <div>
            <h1>Formulaire ajout cellier</h1>
            <form action="submit" onSubmit={handleSubmit}> 
                <label htmlFor="libelle">
                    Libellé :
                    <input
                        type="text" 
                        name="libelle" 
                        id="libelle" 
                        placeholder="Saisir un libellé"
                        value={libelle}
                        onChange={(e)=> setLibelle(e.target.value)}
                        
                    />
                </label>
                <label htmlFor="colonnes">
                    Nombre de colonnes :
                    <input
                        type="number" 
                        min="1"
                        max="1000"
                        name="colonnes" 
                        id="colonnes" 
                        placeholder="Saisir nombre de colonnes"
                        value={colonnes}
                        onChange={(e)=> setColonnes(e.target.value)}
                    />
                </label>
                <label htmlFor="lignes">
                    Nombre de lignes :
                    <input
                        type="number" 
                        min="1"
                        max="1000"
                        name="lignes" 
                        id="lignes" 
                        placeholder="Saisir nombre de lignes"
                        value={lignes}
                        onChange={(e)=> setLignes(e.target.value)}
                    />
                </label>
                <label htmlFor="capacite">
                    Capacité :
                    <input
                        type="number" 
                        name="capacite" 
                        id="capacite" 
                        placeholder="Saisir la capacite"
                        value={capacite}
                        onChange={(e)=> setCapacite(e.target.value)}
                    />
                </label>

                <button>Ajouter Cellier</button>

            </form>
        </div>
        
    );
}

export default FormAjoutCellier;
