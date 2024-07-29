enum LoginAnimations {
  idleStatic('Idle Static'),
  idleAnimated('Idle'),
  listening('Listening'),
  voiceEnd('Voice_End'),
  voiceStart('Voice_Start'),
  voiceLoop('Voice_Loop'),
  maximize('Maximize'),
  minimize('Minimize'),
  wrongPassword('Shake'),
  loadingStart('Processing_Start'),
  loadingLoop('Processing_Loop'),
  loadingEnd('Processing_End');

  final String text;
  const LoginAnimations(this.text);
}
