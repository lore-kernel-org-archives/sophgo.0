Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768826;
	b=QTMEI1amaYVLtbbHhJGEkziunYjO8DW2DrpeZ5PsxBeparPpyCW3xqcCT12Se4811Qe7
	 7yYSuC+HYyXMVqFuie1RlbiRcIBXnlbD02hX0ME5kOkv/jpeHBcx2bbq42RH+8GATZnPk
	 Cj5f7PY+g4SEItxRVeZxAzH6EQik/dq5L1pP4OU8I8tgDezAYu56qeQsx02t3vx2zogQG
	 UOokDgjszviAfIrDlWmppZXfpmmiWfZPpoaFBpJ7/wrokoFWM3I/F2rfE2xMpW0sd4gBD
	 1Pc4YkN5cKQNQwFjou5NXbBdNnweiBA9479lQ/T+ae5/8m2fhR4/1Kn+rSkpkbD4IyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
	b=ChjoSLWe/YSFeR80SBrgnhjxbroOjMc7CZ5WMAay55iJTFugUS8XwnIZ2yTLWcAsan7p
	 kCa0Cxe3yPEHA/4b/Ilnk5BsPPYGbEDmLFb/+ug2TNaVzkRYUF60VFivb/2M9WC1kmqZC
	 t0jXNmaXT63TYa2C9LVB0qsY/r+iyeL2efRTRajtyOrzEeh2aOcvWswqBemhnJ49rCLVV
	 uBBYhYNQRE5ZPAvhffkTqcM4Leh/ubvdcsCbuRZ8h09/bXyCCds6pwDjCxO4O1YU/zqb0
	 2jRXvFwF9KQ2ByIWFg3SFL5XPq1wLInsn7GUrltnNpdfC2e7UZ44sBJjmsvoUBYU4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b="KP1X1d/3";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C3606A336
	for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 18:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45C3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=KP1X1d/3
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so2569175e9.0
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 10:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768824; x=1795373624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=KP1X1d/3cdZtOvtCzDoA2nl68OO1NTKNA6pHmz9+Ex368COIFNz+nDCEJvSrm5tx99
         p5j+GSEw/ZxGM6dTg+1u4RlpPFoaoO46MA3LZTjayNbLqgAmaXIhxD5HCwonpw2FGS8R
         FzMjvtmvU14gpEAWcrcSNa6i0KHXILkDP12Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768824; x=1795373624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze2yB5gk+HNq39+e9lOoLqG+BRZOAZ1FVtK2xhfyPmE=;
        b=usOGVDnzn5wsDfawje0bPlLR+5gp/uT3doQRx3xPIfY6Lu/oWwyQh8M/WpSlrXmRPP
         a+A95FEWw58ZkgASISZ/qzV2jMgksxaPae5za+yoU/yWjSvNOKigqYMHkQVX0eQdu24+
         Ut5u8hF8Voltnj5lSZygZTmc8Jo7TslLnFw1XVLHaaGWJhfgaSvmM36lnHPH67T7d6wh
         krAKTArPLejV91APjhb43xMBjiC1Qn3kaVDcVOKWMkvVL8kUfPVZ7yX+mj7a3T/UCoJQ
         qDeyJiykDU11i+j1+VU4vSLkjamr2/qUNpXNMVR6wi04hER+22uBR0XfwqgkDAg7qgDW
         TZTA==
X-Forwarded-Encrypted: i=1; AL+hErGm6tjfvuxLVsbGaq2cGVl74B5nq9eT9/xX+Z5AjUlnZQNtq9i/1lgxDvWbtXX9AqHZprmoxD8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/6eCMq0L06hi63NmuGJKeTyod1e/TG1xjdS/9Tu7Sg+q0zgcxi
	x53VAzcDbu0XHkTdn575ml/IC3CYOi0qehbWUnNkb0KpgWR267+dJmqbhjoXDK88yxc=
X-Gm-Gg: AYBFou3m7Gx3bqdpTXW5jBJzCslokkgrTB5hcqex4I74OgjuLPjlIft9RxPCr6M5eaw
	DPqyvv+reoyulBki7TI30qp/5yUwYoNohpMWa3wU1m3DTTx0bbg9BA2cFPttTJ/ptAcbfzL7FAC
	LLiFtgeX1weITa60zjje2cJfhoOGS9LKvR/Ce02Q5bs20Aa3t/UJtpRymPFumUZYI36++QZhddn
	nHZKJN1RycaKIjpVTEetxvh5s/3/4ZhSXpoPWfu1FqskWTu0/vyKvsW1pDc6bKLABlJDcJ76f35
	JpOy9kDbbGx3FvGM7hZ7TD5Fm4hJ4rUQkpKeLq2zR5+HfB+ecoK0kX2mS814AIt2GxOd1/4Tq6j
	JfpM5d+h+ee/S9zmsqsRh1Zi+cOS/meLhg9NHo8oDyXEyY1Ld72PCaScwuQBhYLD8Oq97xTSMYw
	a7K19JFDSnkDsoAsvhA1gOom5YQhMfgjXp0z1teQplk1phhBVvDbfvXttinzve27q1bm/199IPC
	qRD14MoPiNcwvH95xqBXlkkKGFWeURALiGzjLaH9kZrxRjYL7R+hhnoESpzDzLW38iS8pG9P2H3
	SRXs3z3ml8EmkvG8nFjbX4DTMsWNTclcTmXGPoAN4XYXURkGcTPwPvrtNC5bevUh2QVfal6v4iZ
	RQtnFIsRclb6TE4CVZ5mGwl8+UJj3auBK9SsJyF9YIfbCagGCdvCuKHwVM+Y+k5Itt/TOtD+Xel
	OWz3iGta8EmKJtMQ==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr88504125e9.16.1794768824018;
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:43 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:34 +0200
Message-ID: <20261115185335.782678-3-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115185335.782678-1-vadim@yuzi.co>
References: <20261115185335.782678-1-vadim@yuzi.co>
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
descriptor anew. Report the BNA with a rate limited warning instead of
at debug level: unlike on an isochronous endpoint it is not expected.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b0e129061..046b5b045 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2305,6 +2305,45 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
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
+ * port. Start the request again; that fills the descriptor anew.
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
+	hs_ep->req = NULL;
+	dwc2_hsotg_start_req(hsotg, hs_ep, hs_req, false);
+}
+
 /**
  * dwc2_hsotg_rx_data - receive data from the FIFO for an endpoint
  * @hsotg: The device state.
@@ -3257,6 +3296,8 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
 		if (hs_ep->isochronous)
 			dwc2_gadget_handle_isoc_bna(hs_ep);
+		else if (using_desc_dma(hsotg) && idx)
+			dwc2_gadget_handle_nonisoc_bna(hs_ep, ints);
 	}
 
 	if (dir_in && !hs_ep->isochronous) {
-- 
2.56.0

