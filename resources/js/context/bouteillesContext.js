import React from "react";

const BouteillesContext = React.createContext();
BouteillesContext.displayName = "BouteillesContext";

export const BouteillesProvider = BouteillesContext.Provider;

export default BouteillesContext;
