Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812686;
	b=qsdDq0q9korz+epAXIpkY8EfgV4EAXC1ab70dLoCz1yRkPVNFbhTkT6meJwx7gQ3mZkH
	 63fLySulNJHQNw0WmhYfATTtWu6dzCm0yi0lAScTzkRYAtkejGzNy1Kq+u/a+uo3GDqEU
	 4MPklEsEApHLzrtTxO4LTIhlH6sVIEeMgMgYDmuHMGrjruW8z0u4KgAhQhrZUgP8G6MOp
	 4UuK3YfMQufANBBGTETt0ascxTgtfJiOAJmhEKx8EjNlp+eT4CW8zPQ6ZPZHbItEU2sky
	 yfXGLYfz4H3N0THy58h6nTAkTK+Z2LfsbYlpvAp8HzQlE7Wr77RpcQ9pLpMIBrF3G+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
	b=IKW1tc9BKKZeT4hmYQkRWXXR0642sRvJOBPZfJ2HLJGiYeVeFLwAKJ/gE7gz55CbTveL
	 mTxmaU/ZqO4yoo2GI1MB7BYWUCDXUGIBPhCU2tf6995+h3PZjrDQAjFusFh7yFhsgEh7O
	 OHLFVq1OKnUp//ufLL1zsRmBpJzDXlKZjTuusUGYW7Xs1Wn1u94X7QSSUVHRt2IryEKEb
	 RZ++qzTbnP/dGp8BUpLXVMrMjDnLWg2AURz8lh3XHsmbr/u1hPMMdHBi5mnE5P+CUX+rd
	 JeCW47KvnjAAXBOPrkvNK2Pwh3PquRRgJqO3HfeZTHVDFw/KtkbyWjU0iJqpfgTUfqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Ac4jyfNf;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7ED606A332
	for <sophgo@lists.linux.dev>; Mon, 16 Nov 2026 07:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D7ED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Ac4jyfNf
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1242434f8f.2
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 23:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812684; x=1795417484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
        b=Ac4jyfNfxvCW25BKgE6FxdqsKESr4UsZEXBv7kDhR1UD+kYV25vwsdAgy6EGkke5sZ
         kQXFFfX9ztvgBsjRfuMvwWiqpetGDQDHMuyQyaYH3rGGTl+ASySO6MzALFGZZfmBcpcr
         6TaEHWmQrRPp7TPe1UYvC+ilKudmsGbkaeSo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812684; x=1795417484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSxGe6Q14H8NquynYqn3HN0rwyDzChffFiquw9hj2d8=;
        b=kEIXUlschjXM9EIcS/73R0H53XjSi8a9eIB4V1KtlLywaL7TpYgKquLsRSFiHO9dOA
         H345rH4DwX41ROfXt4++enc2UGHQXcs4YSFtaxO/Cwf4n3ZAmjkgEl5Q1nafr53vZ0wL
         J0feUMayB8KTzZm2Ca+0Cs6h0TmQShP7m7kkVuhAMPdtV1efv73Y3A+PFEA/mCwNnD3n
         6XKIz2pYcJtYJXZHbR0FRWO2HlegfBGNaf7pQZf87BkMQ1ZtA37X5mTinaq34CnOOUqx
         E1I9BvbYgUEM3BymfvGsrOn3PUhalQaF+7r528fNPypunnbXrByxK0LAbo57uoDFMi9t
         DL6g==
X-Forwarded-Encrypted: i=1; AL+hErHm/cRNLmn3O0epywNq93wmFGWuJJ5YrU2DMyUMNzwPTuaU+mGAfrwmBYkIx74l2T2ABm6Bvu4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9idN1RmQuspttFQ8kR4ZMC7sTM353BKutFMteIVT5yAvOQ4Scc
	45gHk2S1575omZ66NRABnGsHjerJfkE9DylNusr92JUrGEnqM3CV+kx8ZjFXd3r/f9TnG++3aH/
	73WKQ13D1TQ==
X-Gm-Gg: AYBFou27zth4g0q0pPFmiNYhtSlr0SIUtYfAEfd5NZ8OeY+vN/xCuwsBDMnC9PxbbIw
	5ChE6Nhd9k4xBaqLZhlSA1VsizJTN50Z6M/MgqzU4oYhh/KqCSKQq6y6BDGHtbdlgUYzc0sD56c
	p3mEAzjjqR8fVfKXPXjcRXdLH8VSItGqvsJNjL1sNmGXXO/iZNkGaEhpUr6DSKnjKX8G1rcHuNa
	2ygD/yWyDo4fYvFNY/fJLw1HQrFrkRtkUrSkKWixBmbu/BOX3BprsO/Wmy/96hMHp2LT6RrTC1f
	aW8WmfRkclwT/IwLbS5ya5GUfl7jE6kwXN7LvximwAgM3D/7u5OJpZkJuou+pwGBIMt3N1PFS0U
	jg/fYjSI5pT+hLaaKLJV5cLNRMcDKXl9H/1h+k1zQIFBO+B7+XKlvDjUc8nn5iOzajXZRmUPodv
	gTi3qjEYxKMFxbe9u3QSV1Hm66t9I2E6nBgj4kWjhj6/gRfhHtYfR63Js25vkDr/lG1Ix8hzn5h
	ebYhBjtrasNPh6olJAUQ5uR07L1XmK/L+d4wXE+SnyGn/nUM95t18xo5UK8/sG5zVOColNkwHyd
	qrJ7KLEiVdbzHgcVLcwIiLa/z+ef/HDf4QsR56sqaC6ilXEHG4KmeqWUSIbOBrNF14rsL+zjov+
	VKaPF7JOLUp8HnuM8HMRgavr2NXItIvQsBnGOicEMZVDxmVavF1XBxwBdDVgjwkfx1tiZsdbTza
	aP4xXZtFURRYjuCJ4GdqYEHU7XKOBSH4G/r3U=
X-Received: by 2002:a05:6000:2082:b0:48e:7470:9e98 with SMTP id ffacd0b85a97d-49c726dadb2mr21533685f8f.39.1794812684482;
        Sun, 15 Nov 2026 23:04:44 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:43 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints after BNA
Date: Mon, 16 Nov 2026 09:04:32 +0200
Message-ID: <20261116070433.2813951-3-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
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

In descriptor DMA mode the core raises BNA and disables an endpoint when
the descriptor it fetches is not marked host ready. For isochronous
endpoints dwc2 handles that; for bulk and interrupt endpoints it only
logs the interrupt at debug level. Nothing was transferred and no
XferCompl follows, so the request stays current, the requests queued
behind it never start, and the function driver waits for a completion
that never comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a video pipeline loading the
DRAM this happened every minute or two to the bulk IN endpoint of
f_mass_storage: debugfs showed the endpoint disabled with an 18-byte
REQUEST SENSE reply current and nothing done, the 13-byte CSW queued
behind it, and f_mass_storage asleep waiting for its buffer. The host's
command timed out after 30 s and it reset the port. Read in the BNA
handler, the descriptor is 0x0e000012: host ready, last, short,
interrupt on completion, 18 bytes. The chain is written completely
before the endpoint is enabled, so the core fetched the descriptor
before the CPU's stores to it reached memory. The next patch closes
that window on this SoC, but a BNA on such an endpoint should not leave
it dead on any platform.

When a bulk or interrupt endpoint other than EP0 raises BNA, is disabled
and not halted, start its current request again, which fills the
descriptor anew. Start it from what has been transferred of it, the way
the next part of a request longer than one chain is started, so that a
BNA on a later part does not send or fill the start of the buffer
again. Report the BNA with a rate limited warning instead of
at debug level: unlike on an isochronous endpoint it is not expected.
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Restart the request from req.actual (continuing) instead of from its
  beginning.
- Follows the move of the isochronous BNA handling in patch 1; the bulk
  and interrupt restart stays after the endpoint-disabled handler.

 drivers/usb/dwc2/gadget.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 8adc90047..a7eaf75ff 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2389,6 +2389,46 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
+/*
+ * dwc2_gadget_handle_nonisoc_bna - handle BNA interrupt for bulk and
+ * interrupt endpoints in descriptor DMA mode.
+ * @hs_ep: The endpoint, not EP0 and not isochronous.
+ * @ints: The endpoint interrupts that came with the BNA, for the log.
+ *
+ * The core raises BNA and disables the endpoint when the descriptor it
+ * fetches is not marked host ready. The chain of a bulk or interrupt
+ * endpoint is complete before the endpoint is enabled, and afterwards the
+ * descriptor reads host ready, so the core read it before the CPU's writes
+ * to it reached memory. Nothing was transferred and no XferCompl
+ * follows: the request stays current, the ones queued behind it never
+ * start, and the function waits until the host gives up and resets the
+ * port. Start the request again from what has been transferred of it, as
+ * for the next part of a request longer than one chain; that fills the
+ * descriptor anew.
+ */
+static void dwc2_gadget_handle_nonisoc_bna(struct dwc2_hsotg_ep *hs_ep,
+					   u32 ints)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg_req *hs_req = hs_ep->req;
+	u32 epctl_reg = hs_ep->dir_in ? DIEPCTL(hs_ep->index) :
+					DOEPCTL(hs_ep->index);
+	u32 epctl = dwc2_readl(hsotg, epctl_reg);
+	u32 status = hs_ep->desc_list ? READ_ONCE(hs_ep->desc_list[0].status) : 0;
+	bool restart = hs_req && !hs_ep->halted &&
+		       !(epctl & (DXEPCTL_EPENA | DXEPCTL_STALL));
+
+	dev_warn_ratelimited(hsotg->dev,
+			     "%s: BNA, DxEPINT %08x DxEPCTL %08x descriptor %08x, %s\n",
+			     hs_ep->name, ints, epctl, status,
+			     restart ? "request restarted" : "not restarted");
+
+	if (!restart)
+		return;
+
+	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, true);
+}
+
 /**
  * dwc2_hsotg_rx_data - receive data from the FIFO for an endpoint
  * @hsotg: The device state.
@@ -3350,6 +3390,15 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 	if (ints & DXEPINT_BACK2BACKSETUP)
 		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
+	/*
+	 * A bulk or interrupt endpoint is restarted here, after the
+	 * endpoint-disabled handler above has flushed the TxFIFO of an IN
+	 * endpoint.
+	 */
+	if ((ints & DXEPINT_BNAINTR) && !hs_ep->isochronous &&
+	    using_desc_dma(hsotg) && idx)
+		dwc2_gadget_handle_nonisoc_bna(hs_ep, ints);
+
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
 		if (ints & DXEPINT_INTKNTXFEMP) {
-- 
2.56.0

