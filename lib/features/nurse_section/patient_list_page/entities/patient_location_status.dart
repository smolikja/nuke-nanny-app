enum PatientLocationStatus {
  reception,
  waitingRoom,
  consultation,
  injection,
  uptakeBox1,
  uptakeBox2,
  uptakeWaitingRoom,
  petScan,
  dischargeBox1,
  dischargeBox2,
  dischargeWaitingRoom,
  leftFacility;

  String get title => switch (this) {
    PatientLocationStatus.reception => 'recepce',
    PatientLocationStatus.waitingRoom => 'čekárna',
    PatientLocationStatus.consultation => 'pohovor s lékařem',
    PatientLocationStatus.injection => 'aplikace',
    PatientLocationStatus.uptakeBox1 => 'akumulace boxu č. 1',
    PatientLocationStatus.uptakeBox2 => 'akumulace boxu č. 2',
    PatientLocationStatus.uptakeWaitingRoom => 'akumulace čekárna',
    PatientLocationStatus.petScan => 'PET',
    PatientLocationStatus.dischargeBox1 => 'čekání na propuštění box č. 1',
    PatientLocationStatus.dischargeBox2 => 'čekání na propuštění box č. 2',
    PatientLocationStatus.dischargeWaitingRoom =>
      'čekání na propuštění čekárna',
    PatientLocationStatus.leftFacility => 'pacient je pryč',
  };
}
