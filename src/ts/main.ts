import { helloWorld } from './fileToImport';
import { wipeCache } from '../lua/wipePackageCache';

wipeCache();
helloWorld();