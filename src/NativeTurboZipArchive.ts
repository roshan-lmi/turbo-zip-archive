// @ts-ignore
import type { TurboModule } from 'react-native/Libraries/TurboModule/RCTExport';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  getConstants: () => {};

  //
  // Regular JSI
  //
  getGreeting(name: string): string;

  unzip(
    from: string,
    destinationPath: string,
    charset: string
  ): { error?: Object; path: string };
}

export default TurboModuleRegistry.getEnforcing<Spec>('TurboZipArchive');
