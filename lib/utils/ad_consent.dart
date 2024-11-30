import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final ConsentManager consenting = ConsentManager();

class ConsentManager with ChangeNotifier {
  ConsentStatus? status;
  bool get hasConsent =>
      status == ConsentStatus.obtained || status == ConsentStatus.notRequired;
  ConsentManager() {
    _initializeConsent();
  }
  // Initialize the consent process and update status
  void _initializeConsent() {
    ConsentInformation.instance.getConsentStatus().then((newStatus) {
      status = newStatus;
      notifyListeners();
    });
  }

  void updateConsent() {
    final params = ConsentRequestParameters(
      tagForUnderAgeOfConsent: false,
      consentDebugSettings: ConsentDebugSettings(
        debugGeography: DebugGeography.debugGeographyEea,
      ),
    );
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          _loadForm();
        }
      },
      (FormError error) {
        // Handle consent update error here
      },
    );
  }

  void _loadForm() {
    ConsentForm.loadConsentForm(
      (consentForm) async {
        status = await ConsentInformation.instance.getConsentStatus();
        notifyListeners(); // Notify listeners about the status change
        if (status == ConsentStatus.required) {
          consentForm.show(
            (formError) => _loadForm(), // Retry loading the form on failure
          );
        }
      },
      (formError) {
        // Handle form load error here
      },
    );
  }

  Future<void> debugReset() async {
    await ConsentInformation.instance.reset();
    _initializeConsent(); // Re-initialize the consent after reset
  }
}