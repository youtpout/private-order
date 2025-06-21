use aztec::{prelude::AztecAddress, protocol_types::traits::{Deserialize, Packable, Serialize}};


#[derive(Deserialize, Eq, Packable, Serialize)]
pub struct Order {
    pub bid_amount: u128,
    pub ask_amount: u128,
    pub bid_token: AztecAddress,
    pub ask_token: AztecAddress
}

impl Order {
    pub fn new(
        bid_amount: u128,
        ask_amount: u128,
        bid_token: AztecAddress,
        ask_token: AztecAddress,
    ) -> Self {
        assert(bid_amount > 0 as u128, "Bid can't be zero");
        assert(ask_amount > 0 as u128, "Ask can't be zero");
        assert(bid_token != AztecAddress::default(), "Bid token can't be zero");
        assert(ask_token != AztecAddress::default(), "Ask token can't be zero");
        assert(bid_token != ask_token, "Same token address for bid and ask");

        Self { bid_amount, ask_amount, bid_token, ask_token }
    }
}
