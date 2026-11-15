Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780189;
	b=mKWc52kHt1go3rpkI66T4XxCVq1VCnpHeBvGsQbvujgQ8jvGQFlXVnDZuBMQe3P0MEvh
	 A0c6OtcslOSvSV6TmKDzErEAP4VI+R3dCHXdB+4SkxDVeGdbTUvM0HY3ULnX9lFIFd6kp
	 3yIKu9ls2NMFEaA7OdNWVLyeUvrHv+A5xjTc+Fka0SSnb/Ic95ZgGLRJR76DcMtogYWZ2
	 WvAwn8IlE3H639pnWNR2wcSOanq+Q7F7M7AAT1kkfRcqNGkeosirEL+cAs8jFEbOOlWno
	 h2nwAmUsvmW8wRa0eRoYfhhl3980pZkGUi0+NKrr0tDkQYzGDBRUGENBvjwUof9FMfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
	b=dBvDzHilb+VYNW8HjD30IrNi6u+P0B6GZFVyT+C+LNbjyBPaigAya8zKRIGBRpuav4TU
	 ezx0fo2ZpjOMJ58MpcfdKO1XCJT1mZxUz3IxYQtVcm/gbJ+uaWJeZM8n8o9QyHvZ+j6gp
	 bTMcndWlEm1ccPoE3qGuEmEWAnMrzjoARIudHCwAh0VOfXpPWSw45IWXEKXBZEvkBURZW
	 zUQ6JM+LY/u1hbof5ChnY0cV/AzN532Cw0TbFlTAhu7MzUHxZ50d8RrOJ4QWe3xzUZr0f
	 zIq9/LwE/Bhq8gO2b3g6OtiDeP5tjNlD25HzP/GFdlwx16J986SFqh4xL5fe64ckx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Fcrbv9zb;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A4606A31F
	for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 22:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6A4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Fcrbv9zb
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1387458f8f.2
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794780187; x=1795384987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=Fcrbv9zbt58oXf7uP7iP/o1IIM9ZgypHch4hM9t8yJlO0eqAhQ1mM6WxylDDthdqlF
         9to8DH673Jr8axD8ygg9WG0y4icHBCd8f9V2PBe7ZQzyxus31QGtO/X/1OpDzS1TBuya
         v5p6tGRDrRV5ATE6WLTAW4IP6eOfjbO2J5cPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780187; x=1795384987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvuwrZIWInS/vmhg3MkifAQ2jLu31ynJDcJbkxB/zW8=;
        b=iDDr8C26OCOaVeSZd+PXEJeYXb0blk3sEfPCbj6wKXvNI/TkOLgb/PYlzdVYKLG5nD
         VAxsn/UGyQWlYKdq0CmbWd62+0IsqKWUdZ6lfd0FB/Ql80l+bjI9sLSQJkcSsYjLA+b4
         sTWtOFyydJTFOwxS7m90GunlddUJaHNTLAcgNR3GAhJWEZmvQkf5ka0dxdUKf716GzKI
         VWp6ywZqJvfaU+0rsbZ8/iYPsuEozaGHoGH0uNreL7NOx4TDd7lUnQ2Xa+xzwTtO+UJR
         N4PB6TMQpAQuRtkFIKhXQjxVk7rJnEgf2wO08w8duvkRS8CPTmCt8A8vsL9GgJG2azfH
         H+8A==
X-Forwarded-Encrypted: i=1; AL+hErEKOyOkb2oCBdlrw2+vxQrlGu+kSn93BHkY3+Ae9w2vmBNYJPXyOJDn1wr5bGY1+hLGM0d2u2I=@lists.linux.dev
X-Gm-Message-State: APuU4Z91am4OGhWJR7+d45dpAdzG/aVRMn/VTekg5cKZkzLCXSiR2ySq
	yV+C8KKsW48SiDAzSNPf8/8h3Pfj1+GSRSujoCgurbHTDe1ppRsnzr8Uv/DJXp5U2H0=
X-Gm-Gg: AYBFou2viEW9CaRd9GODjOC3BiIxSL7/gKI5o5tGS99RdIvIR/Y1e7jrhdmKNHssTsu
	bxPaPkzwzLbKq++r6nkiQVAIRTuWA2RF8KwYqdzsl7hAaSzbCAkPLLrOjgxagxOnm7qEI1xB1gR
	bhPaKt/E65FcWW2QLpqhGkTZ8IEW5bm0+OC5JJw/Rbd+AwtaNkORZQmDytJmRE2AjEmfx7Qmqdr
	sABrUaWdV8KM3llKhnQ9FpI9Ux5wHbOFPs6Q/EsnLJWuSBz3Seuvvsf20dBl+HRi+Bgvb4v3AMA
	sYW02yqVS/rZZgBFxaZM6T8PVAnIs8dkWpe8TNVH8Y51oei3c7GQQs0ZE+hdx+qAdJrt++TCbgT
	QRwkSVqxv2+D8O/ydTz8HNR6OvThptY465aPfcfqTb6yuKpOmu8uo+OBy4uVi/mnGxFW+5fhLj5
	jGR8osxbgBCGqW83qZlq8agBXTmFYRi9t5VzaGgCzNXtWErDYIvxP7I6KfpVS4LmgU+b2UzLuvT
	i3njAZQfAvXACAXklZzwzvRlKsaxGq25OG9x4xy0inVV2Czo0uPAcp2nCGPuJrBhH63186tNFIZ
	sWJWcBFj/dZ9jJgIVth/FcQek1RLr5ScsAJiXyfDHnUi/OJ+D/SWXehJ+ebVE67N06vJX9Ne3D+
	h4LU2mO2GLlfjvyglSteUVELeWVloslMsyuvvkJf3rJvclO7ostlt+hXuNz+OP9TOWNV8Qlkk24
	p2cYw7mHOSJkcXEQ==
X-Received: by 2002:a5d:5e01:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-49c6e4a3953mr20083609f8f.1.1794780186868;
        Sun, 15 Nov 2026 14:03:06 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm16616543f8f.27.2026.11.15.14.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:03:05 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Mon, 16 Nov 2026 00:02:58 +0200
Message-ID: <20261115220258.1519467-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-2-vadim@yuzi.co>
References: <20261115185335.782678-2-vadim@yuzi.co>
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

Please do not apply this patch. It is wrong, and I found that only now,
testing the changes for the Sashiko review. Patches 2 and 3 are not
affected; numbers for them are at the end.

The test: SG2002 (DWC_otg 4.20a), a tone played into the UAC1 gadget,
eight 200 byte requests queued, and interrupts held off for 12 ms once
to cause a BNA. With this patch the endpoint is restarted, as the
changelog says. But from then on it takes one BNA and one restart for
every packet, about 2000 interrupts a second, until the host closes the
stream. Most of the audio still arrives, so the test I did before, which
only looked at whether the stream went on, passed.

A trace of the endpoint interrupt and of the restart shows why (time in
microseconds from the start of the hold; desc0 and desc1 are the status
words of the first two descriptors as the CPU reads them):

  12015 irq      DOEPINT 0211  DOEPCTL 000480c8
  12121 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2d8008  desc1 020000c8
  12129 irq      DOEPINT 0201  DOEPCTL 800480c8
  12630 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
                 desc0 8e2d8008  desc1 020000c8
  12715 restart  DOEPCTL 800480c8  DOEPINT 2201
                 desc0 8e2f8008  desc1 020000c8
  12725 irq      DOEPINT 0201  DOEPCTL 800480c8
  13633 irq      DOEPINT 0200  DOEPCTL 000480c8  DOEPDMA at desc1
  ... and so on, once a millisecond

Right after the restart descriptor 0 is already DMA done, with 192
bytes received, the frame number of the current frame and the L bit
set, while descriptor 1 is host ready and never used. A second trace
point shows descriptor 0 done even before DOEPDMA and EPENA are
written.

So, as far as I can tell from outside:

- After the BNA the core keeps the OUT packet that met it. DOEPCTL
  shows EPENA clear, but the core goes on trying the descriptor at the
  start of the chain and raises BNA each time. That is the repeating
  BNA of the changelog. Flushing the RxFIFO, which
  dwc2_gadget_handle_isoc_bna() does, does not remove the packet.
- The moment descriptor 0 is host ready, the core writes the packet to
  it, without the endpoint being enabled.
  dwc2_gadget_start_isoc_ddma() fills the chain front to back, so at
  that moment descriptor 0 still has L set.
- After that the core is done. DOEPDMA and EPENA are written, the next
  packet finds descriptor 0 used, and there is the next BNA.

What I tried:

- RxFIFO flush just before the restart, clearing DOEPINT.BNA just
  before the enable, reading every descriptor back: no change.
- Global OUT NAK around the restart: GOUTNAKEFF does not come within
  100 us, no change.
- Marking descriptor 0 host ready last, after DOEPDMA is written: the
  chain then runs normally if the core takes descriptor 0 after EPENA
  is set. If it takes it before, the chain again ends after that one
  packet.
- The same, plus: if the core takes descriptor 0 before the enable,
  wait for the packet to land, give the request back, build the chain
  again and enable. No packet is waiting for that second chain. This
  gave one BNA and one restart per hold for 34 holds of 9 to 50 ms.
  Then three runs failed after 10, 19 and 9 restarts, each time on a
  9 ms hold, which is the edge of the eight queued requests: the stream
  stopped, and twice the host reset the port. I have not traced that
  case yet.

Thinh, what does the core expect the driver to do with an isochronous
OUT endpoint after a BNA in descriptor DMA mode? In particular, is
there a way to make it drop the packet it holds, or a defined point at
which the chain may be written again? I would rather do what the core
is designed for than poll a descriptor in the interrupt handler.

The Sashiko findings on this patch (BNA handled after the chain was
restarted in the same interrupt, a BNA latched before the restart) are
real as well and are fixed in what I have, but they do not matter until
the above is solved.

Patches 2 and 3, same board, TEST UNIT READY as fast as the host can
with a 1080p60 H.264 encode running, counters added for the test:

- With the read-back of patch 3 switched off to get BNAs: 368000
  commands in 120 s (3070 a second), 13103 BNAs, 12809 of them
  restarted by patch 2, no port reset. The other 294 were on the bulk
  OUT endpoint, came together with XferCompl and found no request
  current. Two more such runs: one the same, one with a port reset
  whose cause I did not capture.
- With the read-back on: 546000 commands in 180 s, no BNA, no reset.
- In about 40000 BNAs on bulk endpoints the endpoint was disabled when
  the BNA was handled, and no endpoint-disabled interrupt followed. So
  the timing cases Sashiko describes for patch 2 did not occur on this
  core. I do not know what the core guarantees there.
- Patch 2 in that test restarted the request from req.actual, as
  Sashiko suggested, not from its beginning as posted. A BNA on a later
  part of a long request did not occur, so that path is still not
  exercised.

I will send a v2 with the review fixes for patches 2 and 3, and with
patch 1 either done properly or left out.

Vadim
