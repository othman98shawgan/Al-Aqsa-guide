// lib/models/landmarks_data.dart

const List<Map<String, dynamic>> landmarkData = [
  // Mosques
  {
    'id': 'dome_rock',
    'name': 'Dome of the Rock',
    'shortDescription': 'Iconic gold-domed shrine in the center of the compound.',
    'longDescription':
        'The Dome of the Rock is an Islamic shrine located at the center of the Al-Aqsa Mosque compound. It was completed in 691 CE and is believed to enshrine the rock from which Prophet Muhammad ascended to heaven during the Isra and Mi’raj.',
    'imagePaths': [
      'assets/images/dome_rock1.jpg',
      'assets/images/dome_rock2.jpg',
      'assets/images/dome_rock3.jpg',
    ],
    'top': 340,
    'left': 210,
    'type': 'Mosque'
  },
  {
    'id': 'qibli_mosque',
    'name': 'Qibli Mosque',
    'shortDescription': 'Main prayer hall with a silver dome.',
    'longDescription':
        'The Qibli Mosque is the southern building within Al-Aqsa, serving as the main congregational prayer hall. It faces the Qibla and is known for its large prayer space and historical architecture.',
    'imagePaths': [
      'assets/images/qibli_mosque1.jpg',
      'assets/images/qibli_mosque2.jpg',
      'assets/images/qibli_mosque3.jpg',
    ],
    'top': 560,
    'left': 210,
    'type': 'Mosque'
  },
  {
    'id': 'al_marwani',
    'name': 'Al-Marwani Mosque',
    'shortDescription': 'Underground mosque within Solomon\'s Stables.',
    'longDescription':
        'Located in the southeastern corner of Al-Aqsa, Al-Marwani is an underground prayer hall built into a series of ancient vaults known as Solomon\'s Stables.',
    'imagePaths': ['assets/images/al_marwani.jpg'],
    'top': 540,
    'left': 440,
    'type': 'Mosque'
  },

  {
    'id': 'gate_rahma',
    'name': 'Bab al-Rahma (Gate of Mercy)',
    'shortDescription': 'Eastern sealed gate overlooking the Mount of Olives.',
    'longDescription':
        'Bab al-Rahma (Gate of Mercy), also known as the Golden Gate, is one of the most iconic gates of the Al-Aqsa compound. It is located on the eastern wall, facing the Mount of Olives. Though sealed for centuries, it holds great historical and religious significance in Islamic tradition.\n\n❌ Not wheelchair accessible – sealed and not open for entry.',
    'imagePaths': [
      'assets/images/gate_rahma1.jpg',
    ],
    'top': 250,
    'left': 460,
    'type': 'Mosque'
  },

  // Domes
  {
    'id': 'dome_chain',
    'name': 'Dome of the Chain',
    'shortDescription': 'Small dome next to Dome of the Rock.',
    'longDescription':
        'The Dome of the Chain is a small open structure adjacent to the Dome of the Rock. Historically, it was a site of justice and preaching.',
    'imagePaths': ['assets/images/dome_chain.jpg'],
    'top': 340,
    'left': 265,
    'type': 'Dome'
  },
  {
    'id': 'dome_ascension',
    'name': 'Dome of the Ascension',
    'shortDescription': 'Commemorates the Prophet’s ascension.',
    'longDescription':
        'This small dome marks the traditional location from which the Prophet Muhammad ascended during the Isra and Mi’raj. It is a symbol of this spiritual event.',
    'imagePaths': ['assets/images/dome_ascension.jpg'],
    'top': 300,
    'left': 150,
    'type': 'Dome'
  },
  {
    'id': 'dome_khalili',
    'name': 'Dome of al-Khalili',
    'shortDescription': 'Small domed structure named after a sheikh.',
    'longDescription':
        'This dome is named after Sheikh Khalili and is one of the small structures used for prayer and retreat within the compound.',
    'imagePaths': ['assets/images/dome_khalili.jpg'],
    'top': 175,
    'left': 145,
    'type': 'Dome'
  },
  {
    'id': 'dome_prophet',
    'name': 'Dome of the Prophet',
    'shortDescription': 'Commemorates the Prophet’s prayer spot.',
    'longDescription':
        'This dome is believed to mark the spot where the Prophet Muhammad led the previous prophets in prayer before ascending to the heavens.',
    'imagePaths': ['assets/images/dome_prophet.jpg'],
    'top': 310,
    'left': 170,
    'type': 'Dome'
  },
  {
    'id': 'dome_spirits',
    'name': 'Dome of the Spirits',
    'shortDescription': 'One of the eastern domes.',
    'longDescription':
        'This dome is one of the smaller domes located toward the eastern side of the Al-Aqsa compound, often used as a peaceful prayer space.',
    'imagePaths': ['assets/images/dome_spirits.jpg'],
    'top': 130,
    'left': 210,
    'type': 'Dome'
  },

  // Gates
  {
    'id': 'gate_tribes',
    'name': 'Gate of the Tribes (Bab al-Asbat)',
    'shortDescription': 'Northern gate near the Dome of the Rock.',
    'longDescription':
        'The Gate of the Tribes (Bab al-Asbat) is located at the northeastern corner of the Al-Aqsa Mosque compound and is historically used for access to residential areas around the site.\n✅ Wheelchair accessible',
    'imagePaths': [
      'assets/images/gate_tribes1.jpg',
      'assets/images/gate_tribes2.jpg',
      'assets/images/gate_tribes3.jpg',
    ],
    'top': 100,
    'left': 480,
    'type': 'Gate'
  },
  {
    'id': 'gate_chain',
    'name': 'Chain Gate (Bab al-Silsilah)',
    'shortDescription': 'Western gate close to the Dome of the Rock.',
    'longDescription':
        'The Chain Gate (Bab al-Silsilah) is one of the main entrances to the Al-Aqsa Mosque compound from the western side. It is frequently used by worshippers and provides direct access to the Dome of the Rock.\n\n⚠️ Not wheelchair accessible – stairs are present at the entrance.',
    'imagePaths': [
      'assets/images/gate_chain1.jpg',
    ],
    'top': 425,
    'left': 45,
    'type': 'Gate'
  },
  {
    'id': 'gate_iron',
    'name': 'Iron Gate (Bab al-Hadid)',
    'shortDescription': 'Historic gate along the western wall.',
    'longDescription':
        'The Iron Gate (Bab al-Hadid) is located on the western wall of the Al-Aqsa compound. It is known for its iron reinforcement and serves as one of the key access points to the sacred site.\n\n✅ Wheelchair accessible – entrance is level with the pathway.',
    'imagePaths': [
      'assets/images/gate_iron1.jpg',
    ],
    'top': 270,
    'left': 50,
    'type': 'Gate'
  },

  // Buildings
  {
    'id': 'islamic_museum',
    'name': 'The Islamic Museum',
    'shortDescription': 'Museum holding Islamic artifacts.',
    'longDescription':
        'Located near the southwestern edge of the compound, this museum holds manuscripts, ceramics, and other valuable Islamic artifacts.',
    'imagePaths': ['assets/images/islamic_museum.jpg'],
    'top': 620,
    'left': 120,
    'type': 'Building'
  }
];
