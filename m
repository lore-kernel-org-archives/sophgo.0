Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812684;
	b=pqjLzUwTxT2AD/fJZle4SHvpESLKVaG1YIwCCpTkURdDDsGAwo7yi0/OvfmcX2rtrODv
	 sljjFGfHYEww/tpj2dq4BLeqAOFwEsxnZG4r45Ua1bhF1xhj/DaXKA2syAL8WomLTjexl
	 m4OvBQSq62VZyfeoO6CkrQlRk8bulFYai1ivXf9MqIZtV+DDwBz8hUs7NzWKDuhirrvxC
	 e/Y14jn9Ogg4qIYaZZBc1qCPcPFT22mGcNAtXBLldVxe2y5yLEFR4sGsRwFeqTGmNzbJa
	 MecqAjV/LrObbKVY7RjmGvrmwN1kzLYKCVD0uZLjlUN+EC45MPXG/5/K4TiH3huRCTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
	b=r1FHsM36JNOTW8YoXNzaFS/AuSi6diUHZVbYXz4TJ3n0sS0FoCgyly3fsQsX97pKk/IL
	 LTlU6pr5MQ4Nh0WzropxDmHdS+059MhkH+J/lax1T5w2UYYYFiW0S//3Prnqz0Vr9ll8F
	 OptE01NV1YVBjql1yIFCYyLQ2iO0BDVvMfnvNcAf/Obz/yaAmK7XprnOI1rLv1tM7sgpB
	 qb28VMqi1lFaBZ2AhHI6Xt1ShwDO42O0O4/wpB6rEQ5HjphYsSWiDv2pFkri3Ld9NAVRv
	 tJmmW7YZIjEt0OGfOPHcFLBYKynhOfacNBrQo6ZSOBliNt9NAd+MWu/uiMYxZgiSzkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=C9fUSszR;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C16606A32A
	for <sophgo@lists.linux.dev>; Mon, 16 Nov 2026 07:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C16606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=C9fUSszR
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50e9408873so14714066b.0
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812682; x=1795417482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
        b=C9fUSszR/biNEpWHrI3AD1l24SMQuA9aEMbVVOJJKXE8/U+dZ6hxj5Z25swp0Av92y
         kEN/W3Fj11gujTLHvxPSKmFC7hUI26PBclPSzaiOeV/uRSLDU55wS8PkOU2ylbIY5O61
         6mdV5OP9jJt59NyUYi9YBF2p55By01BeYs17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812682; x=1795417482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
        b=ia+QJ+c9EJjNp+y8L4oIlHJPnYQBr5xLdMSMU4zzB9R2P9QDqoIQqC3fDr+IdqDNZ2
         l5T/hY7VWfuQ9WLa5Cf87QZgvHcSDJ5HF9temo0nLG+pMol3BQNreUfQ343ul+Wc0WTn
         y2ARPPQA9yNV5Bfkp7tfgEG4qmGtzSUvAab4nwVEnZsvRU1vGm1cI1pyFpHb+K82fCex
         Vim8b4cF+PdxvWbc7kshUiY3Y7UAzn0hrOQZoXyVq4w8NPVGrxjVvkYJPhjyhYEYBGeK
         iHngMFfNvsrrkIyhsroDjSCo8W80AH7fewV3TAifjsC54fmaz2JRvVGBpzd/sCDn/0J3
         o3LA==
X-Forwarded-Encrypted: i=1; AL+hErFxgibM0NstWtJ5wOSHg7cOH25q60wFH3HmqXycBFDwrTrmc7eMc9lmNy8Jpr2aAm3TOsz5yAY=@lists.linux.dev
X-Gm-Message-State: APuU4Z95+plwwtayhUsk/53FGzwl1/FrNmSUF9aLD8WxfrLrRD8YJ6K5
	1AhLLtuev8SAVTKo2NERT82YkbyoZwdKngJ3nAv8Oe73JeWmdKeTpvOZcrJEEwnsGLs=
X-Gm-Gg: AYBFou09c8FIIKXCZbbMvEXw/8vC7kk4JkiR7hX9BvRBIVo+zFcNxRPqeFRSLHtuzSy
	go4DZLCtqMvPolLy5bPqVhJ1f0xIj/4dESpm9v2eESmiMK9g7g+pVsjQSopx3syqjbuxt97NR8s
	HTS82AOKObZYZjpx/gAbuZzv7arBEEIoR5cZcmliiPIEW+Me2Ewk/RqRLc6Z8ml+7J6zV9RmiWp
	ZEu26FY7XSSfxPq+spbDuJTspyRFyTd5rDXz0h5Cy/78/wc/7NOe6WrhEOGte0kM+00m/QnHIya
	naAxW16SwBg/jGRYv0uk4GGk2brVFacKHlbdddRp1pwHSijQc53KLhoMFrcSngq67H/KahIClEI
	WuDSUvTOySKR4mu1jHD7GFMtBRfYCuaYBWhr/UvuFzxjaHpJVb7fUXh5CXzdRmBuhh1OuKbo3lU
	+OULItJH7Qem5aZFQpkFI7NdcGUElZH2846c9ct/qpeCUSIel76N4sOWsnYjO5TMeJ0Js4/GZ9p
	TeLeoN/UkoAZli144zy57EfaPN/1CFLyJ0PdN5cJ1icAe8TjfuPL9DWCyh2Dnp6CoCWQ6g4E/Wb
	3/d45+SZBDMBHEY+HA385EH6lWVeQ4PEdbnU5civmcuXKKg7LsGzJANr1ZCtLzWrOW9Y0hfVaY6
	Sbm5hDhApvSpKoVZl4swRRe+9wkYGF9klMlpeD9gn7a0OQJrrr2g8/vhueHUlwqziiUzUsbg1wp
	Dok5rTnp0JuJBcBQ==
X-Received: by 2002:a17:907:d406:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c509611660emr716058566b.7.1794812681935;
        Sun, 15 Nov 2026 23:04:41 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:41 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Mon, 16 Nov 2026 09:04:30 +0200
Message-ID: <20261116070433.2813951-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the three patches offered in [1]. Chen-Yu asked for them as a
series and offered to test on a Milk-V Duo 256M.

We run a Sophgo SG2002 (T-Head C906, DWC_otg 4.20a) as a peripheral with
g_dma and g_dma_desc both on, as a composite gadget: mass storage, HID,
ACM and UAC1. Descriptor DMA works there, but only with these changes.

Patch 1: an isochronous OUT endpoint that takes a BNA is never restarted,
and the BNA interrupt then repeats until the host resets the port. The
v1 patch was wrong, as I wrote in [3]; this one is rewritten.

Patch 2: a bulk or interrupt endpoint that takes a BNA is only logged at
debug level. It stays disabled with its request current, and the
function waits until the host times out.

Patch 3: why bulk endpoints took BNAs at all on this SoC. The core
fetches the descriptor before the CPU's stores to it have reached DRAM,
although writel() orders them before the enable. Reading the last
descriptor back between two full barriers closes the window. The
measurements are in the patch.

Patches 1 and 2 look generic to dwc2 descriptor DMA. Patch 3 is the one
I am least sure where to put. The effect was seen on the C906 only, and
the read-back costs one uncached load per transfer on every platform. If
it should sit behind a quirk or a core parameter, or belongs in the
RISC-V T-Head errata code instead of dwc2, I will redo it that way.

Patch 2 starts the current request again from what has been transferred
of it. We only hit the BNA on a chain of one descriptor with nothing
transferred. A BNA on a later part of a long request, or in the middle
of a scatter-gather chain, was not exercised.

Testing, on the SG2002 with the series applied to 7.3 plus counters and
a hook that holds interrupts off for a given time.

Patches 2 and 3, under the load described in patch 3 (TEST UNIT READY
as fast as the host can, a 1080p60 H.264 encode running): with the
read-back of patch 3 switched off, 368000 commands in 120 s (3070 a
second) with 13103 BNAs, 12809 of them restarted by patch 2, and no
port reset; the other 294 were on the bulk OUT endpoint, came together
with XferCompl and found no request current. Two more such runs: one
the same, one with a port reset whose cause I did not capture. With the
read-back on, 546000 commands in 180 s, no BNA and no reset. In all
runs the endpoint was disabled when the BNA was handled, and no
endpoint-disabled interrupt came for a bulk or interrupt endpoint.

Patch 1. A tone is played into the UAC1 gadget, eight requests of 1 ms
are queued, and interrupts are held off for 3 to 40 ms every 1.6 s.
v1 does restart the endpoint, but then takes one BNA and one restart
for every packet, about 2000 interrupts a second, until the stream is
closed; the audio is mostly intact, which is why I did not see it
before. The reason is in the changelog: the core keeps the packet that
met the BNA and writes it to the first descriptor that becomes ready,
before the endpoint is enabled.

With that packet handled, the endpoint still stalled about once in 100
restarts, 5 times in some 900 holds of 9 ms: every isochronous OUT
packet dropped with OUTTKNEPDIS, bulk OUT NAKed, GINTSTS.RXFLVL stuck,
then a port reset by the host and no answer on EP0. In the traces an
OUT token had arrived while the BNA handler ran, and the handler
flushes the Rx FIFO. With the flush removed, on the same kernel, 1360
holds gave no stall.

This series as posted, plus counters: 480 holds of 9 ms, 480 BNAs
handled, 480 restarts, the stream never stopped. 400 holds of 3 to
40 ms: 361 restarts, none for 3 to 7 ms, one for 9 and 12 ms, two for
20 and 40 ms. 90 holds of 8 to 40 ms with the TEST UNIT READY load on
the mass storage function at the same time: 108 restarts, 608000
commands in 150 s, no BNA on a bulk endpoint, no port reset.

Not tested: isochronous IN, full speed, an interval above 1, and a
stream that the function stops feeding.

To try it on a CV18XX/SG200X board, gadget DMA has to be allowed, since
dwc2_set_cv1800_params() turns it off:

  --- a/drivers/usb/dwc2/params.c
  +++ b/drivers/usb/dwc2/params.c
  @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
   	p->host_dma = false;
  -	p->g_dma = false;
   	p->speed = DWC2_SPEED_PARAM_HIGH;

and "usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X"
must not be applied. That change is not part of this series. Whether
DMA should become the default on these SoCs is a separate question, and
host DMA was not tested.

An AI coding assistant (Claude) was used in the debugging sessions and
in drafting the code and the changelogs. The measurements were made on
real hardware, and I have reviewed the patches.

Changes in v2. The first three are from the Sashiko review of v1 [2],
the rest from the test above:
- Patch 1: handle BNA before the endpoint-disabled, OUT token and NAK
  interrupts in dwc2_hsotg_epint(), and ignore a BNA for an OUT endpoint
  that is enabled. Fixes tag added.
- Patch 2: restart the request from req.actual instead of from its
  beginning.
- Patch 3: read the last descriptor back also when the isochronous
  chain is full and next_desc has wrapped to 0.
- Patch 1: the chain start keeps descriptor 0 host busy until the chain
  is written and the chain address is set, and deals with a packet the
  core holds from before the BNA.
- Patch 3: read descriptor 0 of an isochronous chain back as well, now
  that it is marked host ready last.
- Patch 1: the BNA handler no longer flushes the Rx FIFO.

Raised in the review and not changed:
- Patch 1, queue empty at the BNA: the endpoint stays disabled until
  the function queues again. On this core BNA repeats while the endpoint
  is disabled, and the next one restarts it.
- Patch 2, BNA handled before the core has cleared EPENA, or
  endpoint-disabled latched after the restart: in about 40000 BNAs on
  bulk endpoints the endpoint was always disabled already, and no
  endpoint-disabled interrupt followed. I do not know what the core
  guarantees. Thinh, if the restart should wait for the
  endpoint-disabled interrupt, I will do it that way.

Thinh, patch 1 is built on what I saw this core do, not on what it is
specified to do: it holds the packet that met the BNA and delivers it
to the first ready descriptor while the endpoint reads as disabled, and
it does not survive a Rx FIFO flush with OUT traffic going on. If the
databook describes the recovery differently, please say so.

[1] https://lore.kernel.org/r/CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com
[2] https://lore.kernel.org/r/20261115185335.782678-1-vadim@yuzi.co
[3] my reply to [PATCH 1/3] in [2]

Vadim Yuzifovich (3):
  usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints
    after BNA
  usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints
    after BNA
  usb: dwc2: gadget: make descriptors visible before the endpoint is
    enabled

 drivers/usb/dwc2/gadget.c | 249 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 234 insertions(+), 15 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

