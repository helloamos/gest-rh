class Employe < ApplicationRecord
    validates_presence_of :matricule

    #
    EMPLOYE_SEXE = [["Femme"],["Homme"]]
end
