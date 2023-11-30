class TaxInformationDTO {
  final String companyNPWP;
  final String taxableDate;
  final String taxPersonName;
  final String taxPersonNPWP;

  TaxInformationDTO({
    required this.companyNPWP,
    required this.taxableDate,
    required this.taxPersonName,
    required this.taxPersonNPWP,
  });
}
