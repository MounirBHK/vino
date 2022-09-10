import React from "react";
import { BulkDeleteButton, useDeleteMany } from "react-admin";

function CustomDeleteBtn({ setBouteilles, bouteilles, selectedIds }) {
    return (
        <BulkDeleteButton
            onClick={() => {
                const newBouteilles = bouteilles.filter(
                    (bouteille) => !selectedIds.includes(bouteille.id)
                );
                setBouteilles(newBouteilles);
            }}
        >
            Delete
        </BulkDeleteButton>
    );
}

export default CustomDeleteBtn;
