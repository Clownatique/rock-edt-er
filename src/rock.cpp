#include <iostream>
#include <string>

using namespace std;


class Musicien {
public:
    Musicien(const string& prenom, const string& nom_famille);
    ~Musicien();
};

class Instrument {
public:
    Instrument(const string& typeI);
    ~Instrument();
};

class Morceau {
public:
    Morceau(const string& progression, const string& setlist, const string& titre);
    ~Morceau();
};

class Vendredi {
public:
    Vendredi(const string& dateV, const string& concert_astree);
    ~Vendredi();
};

class Creneau {
public:
    Creneau(const string& dateV, int duree, int idMo, int idMu);
    ~Creneau();
};

class Appartenir {
public:
    Appartenir(int idI, int idMu);
    ~Appartenir();
};

class Composer {
public:
    Composer(int idMo, int idI);
    ~Composer();
};

class Proposition {
public:
    Proposition(int idMo, int idMu, const string& proposant);
    ~Proposition();
};

