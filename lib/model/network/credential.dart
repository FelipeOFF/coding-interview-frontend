class Credential {
  const Credential(this.certificatePem, {this.privateKey});

  final String certificatePem;
  final String? privateKey;
}
