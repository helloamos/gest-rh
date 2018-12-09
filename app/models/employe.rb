class Employe < ApplicationRecord
    validates_presence_of :matricule

    #
    EMPLOYE_SEXE = [["Femme"],["Homme"]]
    EMPLOYE_SITUATION = [["Célibataire"],["Marié(e)"], ["Divorcé(e)"], ["Veuve"], ["Veuf"], ["Fiancé(e)"]]
end
