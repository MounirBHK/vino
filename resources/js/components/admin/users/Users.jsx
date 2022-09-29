import React from "react";
import { List, Datagrid, TextField } from "react-admin";
import ListeActionsUsers from "./ListeActionsUsers";

function Users() {
    const hostOriginURL = window.location.origin;
    return (
        <List actions={<ListeActionsUsers />}>
            <Datagrid bulkActionButtons={false}>
                <TextField source="id" />
                <TextField source="name" />
                <TextField source="email" />
                <TextField source="prenom" />
                <TextField source="nom" />
            </Datagrid>
        </List>
    );
}

export default Users;
