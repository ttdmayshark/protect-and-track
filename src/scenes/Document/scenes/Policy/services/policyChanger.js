import Virtru from 'utils/VirtruWrapper';

export const NOPE = 'NOPE';

/**
 * Event handler generator that updates a the policy as a side effect.
 * @param updatePolicy the policy setter action
 * @param change function that takes a PolicyBuilder and manipulates it, which an optional `event` second argument
 */
export function generatePolicyChanger(policy, updatePolicy, change) {
  return e => {
    e && e.preventDefault();
    const policyBuilder = Virtru.policyBuilder(policy);
    if (change(policyBuilder, e) === NOPE) {
      return false;
    }
    updatePolicy(policyBuilder.build());
    return false;
  };
}
