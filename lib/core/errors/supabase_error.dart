class SupabaseError {
  
static  String mapSupabaseError(String message) {
  final msg =  message.toLowerCase();

  if (msg.contains('invalid login credentials')) {
    return  'Invalid email or password. Please try again.';
  }
  if (msg.contains('email not confirmed')) {
    return 'Your email is not confirmed yet. Please check your inbox.';
  }
  if (msg.contains('user already exists')) {
    return 'This email is already registered. Try logging in instead.';
  }
  if (msg.contains('rate limit')) {
    return 'Too many attempts. Please wait a moment and try again.';
  }
  if (msg.contains('network') || msg.contains('connection')) {
    return 'Network error. Please check your internet connection.';
  }
  if (msg.contains('password is too short')) {
    return 'Password is too weak. Please use at least 6 characters.';
  }

  return 'An unexpected error occurred. Please try again later.';
}
}
