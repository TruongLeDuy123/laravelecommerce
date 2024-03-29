<div>
    <div class="py-3 py-md-4 checkout">
        <div class="container">
            <h4>Thanh toán</h4>
            <hr>

            @if ($this->totalProductAmount != '0')
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="shadow bg-white p-3">
                            <h4 class="text-primary">
                                Số lượng sản phẩm :
                                <span class="float-end">${{ $this->totalProductAmount }}</span>
                            </h4>
                            <hr>
                            <small>* Hàng sẽ được giao sau 3 - 5 ngày.</small>
                            <br />
                            <small>* Đã bao gồm thuế và các phí khác?</small>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="shadow bg-white p-3">
                            <h4 class="text-primary">
                                Thông tin cơ bản
                            </h4>
                            <hr>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label>Họ và tên</label>
                                    <input type="text" wire:model.defer="fullname" id="fullname"
                                        class="form-control" placeholder="Nhập tên" />
                                    @error('fullname')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label>SĐT</label>
                                    <input type="number" wire:model.defer="phone" id="phone" class="form-control"
                                        placeholder="Nhập SĐT" />
                                    @error('phone')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label>Email</label>
                                    <input type="email" wire:model.defer="email" id="email" class="form-control"
                                        placeholder="Nhập Email" />
                                    @error('email')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label>Mã Pin (Mã Zip)</label>
                                    <input type="number" wire:model.defer="pincode" id="pincode" class="form-control"
                                        placeholder="Nhập Pin-code" />
                                    @error('pincode')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Địa chỉ</label>
                                    <textarea wire:model.defer="address" id="address" class="form-control" rows="2"></textarea>
                                    @error('address')
                                        <small class="text-danger">{{ $message }}</small>
                                    @enderror
                                </div>
                                <div class="col-md-12 mb-3" wire:ignore>
                                    <label>Lựa chọn phương thức thanh toán: </label>
                                    <div class="d-md-flex align-items-start">
                                        <div class="nav col-md-3 flex-column nav-pills me-3" id="v-pills-tab"
                                            role="tablist" aria-orientation="vertical">
                                            <button wire:loading.attr="disabled" class="nav-link active fw-bold"
                                                id="cashOnDeliveryTab-tab" data-bs-toggle="pill"
                                                data-bs-target="#cashOnDeliveryTab" type="button" role="tab"
                                                aria-controls="cashOnDeliveryTab" aria-selected="true">Thanh toán khi giao hàng</button>
                                            <button wire:loading.attr="disabled" class="nav-link fw-bold"
                                                id="onlinePayment-tab" data-bs-toggle="pill"
                                                data-bs-target="#onlinePayment" type="button" role="tab"
                                                aria-controls="onlinePayment" aria-selected="false">Thanh toán Online</button>
                                        </div>
                                        <div class="tab-content col-md-9" id="v-pills-tabContent">
                                            <div class="tab-pane active show fade" id="cashOnDeliveryTab"
                                                role="tabpanel" aria-labelledby="cashOnDeliveryTab-tab" tabindex="0">
                                                <h6>Chế độ thanh toán khi giao hàng</h6>
                                                <hr />
                                                <button type="button" wire:loading.attr="disabled"
                                                    wire:click="codOrder" class="btn btn-primary">
                                                    <span wire:loading.remove wire:target="codOrder">
                                                        Đặt hàng (Thanh toán khi nhận hàng)
                                                    </span>
                                                    <span wire:loading wire:target="codOrder">
                                                        Đang đặt hàng
                                                    </span>
                                                </button>

                                            </div>
                                            <div class="tab-pane fade" id="onlinePayment" role="tabpanel"
                                                aria-labelledby="onlinePayment-tab" tabindex="0">
                                                <h6>Chế độ thanh toán trực tuyến</h6>
                                                <hr />
                                                {{-- <button type="button" wire:loading.attr="disabled" class="btn btn-warning">Pay Now (Online Payment)</button> --}}
                                                <div wire:ignore>
                                                    <div id="paypal-button-container"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            @else
                <div class="card card-body shadow text-center p-md-5">
                    <h4>Không có sản phẩm nào trong giỏ hàng để thanh toán</h4>
                    <a href="{{ url('collections') }}" class="btn btn-warning">Mua sắm ngay</a>
                </div>
            @endif
        </div>
    </div>
</div>

@push('scripts')
    <script
        src="https://www.paypal.com/sdk/js?client-id=AcVBbxi2LGdaDEJR3LCDdiNfsVBLLHJ5XNrBhRFFdjXWjOhZA1gaJce1vRN6cu3GHDPaeOnFjcZrFQ2C&currency=USD">
    </script>
    <script>
        paypal.Buttons({
            onClick: function() {
                // Show a validation error if the checkbox is not checked
                if (!document.getElementById('fullname').value ||
                    !document.getElementById('phone').value ||
                    !document.getElementById('email').value ||
                    !document.getElementById('pincode').value ||
                    !document.getElementById('address').value
                ) {
                    window.livewire.emit('validationForAll')
                    return false
                } else {
                    @this.set('fullname', document.getElementById('fullname').value)
                    @this.set('email', document.getElementById('email').value)
                    @this.set('phone', document.getElementById('phone').value)
                    @this.set('pincode', document.getElementById('pincode').value)
                    @this.set('address', document.getElementById('address').value)
                }
                // alert(document.getElementById('fullname').value)
            },

            createOrder: (data, actions) => {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: "{{ $this->totalProductAmount }}"
                        }
                    }]
                })
            },

            onApprove: (data, actions) => {
                return actions.order.capture().then(function(orderData) {
                    console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                    const transaction = orderData.purchase_units[0].payments.captures[0]
                    if (transaction.status == "COMPLETED")
                    {
                        window.livewire.emit('transactionEmit', transaction.id)
                    }
                    // alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`)
                })
            }
        }).render("#paypal-button-container");
    </script>
@endpush
