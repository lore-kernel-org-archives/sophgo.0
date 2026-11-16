Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812688;
	b=Ve8A+p5zVz37uche2L5ai56tHIh1dWRrC/k1UKdPoeedQYR0NEZUP1n8yBTlCxzc/jgO
	 yDtOJ5IWD2QZtw01Dnr0gF/XyG8D/1wYG9UmN/eQIydYO+clrf0Ex3cECHjcvaS8U/T1e
	 bc0OU0414hwJRDdI3HEs6xMmc6OKhpsUkP2aMhih1LQcgqDxKMBpZc1c3nb6i3gNwG8h9
	 o2wt6b4Gsd8UdYyK8urUEaV29h/KA6mkl7BIyO3JA3wGX6jG3du97uqHdDkAhV+0SiVJV
	 vBJHd836Lyvo1/TPdVl8IIAL94WqExJS4c05xsOOvWcofaStUMZjbd1khaQfSPDgKEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
	b=HbWcSdQ/ugthSKOMWpqySIkRriSg7NMwzUDu1ukrxBIXJF0vcd8lNm09VUwXxTi7D8rv
	 aAz+C1Ncylt6Gfz7+lVmS4FeRTacRePFn65Piw02Bma2GPk6v6DnZ91cPcpITk4/koVsA
	 2gQtxNfnZh0hNgXAumaGC+v5QuCV1bklEGVRlwT3g+ihV6W8Sb8TWrcZq73qcAXXZw8BT
	 2SHQ4ER8AGdcxEiaRmFMx3sJveiYo8xFVdHvM+utMVqfxwSwU1mNqWpPsoWhyqh+us2cY
	 cAA8x2VkMYI0jpFGUJ5UtS3wljH44jacBde8+rnMfMp2zWks5LcUum/F0bUoig0ZW/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=aC20CAlg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986EF606A884
	for <sophgo@lists.linux.dev>; Mon, 16 Nov 2026 07:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986EF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=aC20CAlg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22836335e9.1
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812686; x=1795417486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
        b=aC20CAlgbz3jc/acCfDufDpoPRrpn4/0d3URM4t0ypgZAt1MIXSbc9dlRrTRVJoK8Y
         v9gecAN6zRocfMBzajYr/PqVY+gSepW5UE6I1Z5hvcuK9U3yTU6KGb45OAJwFe7LlNdp
         aqFQrFbaAFxcEaflIDCKVDkMf3xGqbTCVYzb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812686; x=1795417486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omQopKG0vJN/8IAN9W8FBopNM44OY3QKRAS5YIysdeY=;
        b=k+TFab8NV0Ey38anuvdbZUNCMH7L1K4sgLJ5Vh9GQ3T14aVIXxNdDNMi9g/QtjxbSr
         hDHqx1NaZOApusOJpE2XmJGoRitEB73gjIAc5WlanBUg01SXy1EEX1MTwO0jumLmy1CX
         GDTLAajVN99cmJ0wV547pYs/vkvncZ8Wfd/zyjVojsAwbMBFyWJUmMInmtJrohjWdlOv
         utRoREQWuHGYCZq3tgxnRqslRBSPe25Od6FBXW209Qr1tIbM6wk5N/hrMHY0D0bXAHBg
         o8KUyr+mVqiYX1KHxzsWypl71Q2FcnfH4ihuo9/0P3aCpY+/MCNC/+jL4oHACXKznUmi
         iU/g==
X-Forwarded-Encrypted: i=1; AL+hErHlVfUCHSlAUskcyPePdeda/9bU6ETD4IXZxGYVuZZyBzllG7i8I8V5p8cSJLtpfxJUuCWjvE0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TnygBnicFK+Rj/7ngs0rsWxTQ8E+tiFbhD1gCQFw41HusALYc
	DZb/TZhTPp/61O20m0tRf3zdeuLhCUo+zx0CbYzyrWmcc2voOfA+T3QZxmxnf3OSx70=
X-Gm-Gg: AYBFou1Nnfv7mA6rGaoRzZH3/Gpix0VWbNJT+kweF0pbyoq2TKy8RNkYsUNfNcPoWYZ
	6cFw/e4LLVpKHxnpFg7aSqxOdcgyHtEYta/H1lTYaqp87Jt2k/E57gZRzL09JwvLPpUPUUhDTLD
	iR+L9EnvAAxZS/AtSW7mBFyawCYmj/tJC/Zk0M6X72HV2/Xkg8e0DnrhSPQxPIVrf43iNR1mZ6O
	StuBwuh9uvO3jSDElBnGq8EPO0nl4T6YoYDyeo8vKkOGAEk/4C8pbHJesW5wBgXFr/fTOeGxPa6
	QYtvuIDURmPKOfvaT2mtHMxPgfw/Ide7A6Te9GTKyRRozyTNc7E8psHu1WfTqEMY/UeENS6+cNF
	yaznHNl63dSgAUx7ZiIgc8mqZHyJqZWi98s2mgLWNctQMs9SZ8ZbC/nlFFQ+jJTA/PNT5FdO8EM
	P6oxkqHoLwLWr0jmm+nAcpSo4wxo3y+7fYuAICvfZGuA+XhuM1Zx9qaIEMnKAhJoQHpReOivHvH
	B7UBEhfsOpOdGDP80jEojM+Z+vTZ2Q6zv2PgP59hBksPWOmgbKxCJj0ed9VCL/LvwwKcJNhD4Ry
	OZIuDCCGpwF5ByS1mNAb/geXcW1eGcTrenS8V1yPcR/J66MCdleZFsca7p7vg6lHExvGP5djRPc
	TQwL01cKRIKo9f6KT1bE0Ba7RV+IzPFUB4P/+B9F/ats6RW18Esl/3es2+Omdgdxuf3l0qPl5ow
	qRryhi0v0QgIEnjQ==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr146040465e9.4.1794812685829;
        Sun, 15 Nov 2026 23:04:45 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:45 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 3/3] usb: dwc2: gadget: make descriptors visible before the endpoint is enabled
Date: Mon, 16 Nov 2026 09:04:33 +0200
Message-ID: <20261116070433.2813951-4-vadim@yuzi.co>
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

In descriptor DMA mode the core fetches the first descriptor of a chain
as soon as the endpoint is enabled. dwc2 fills the chain in coherent
memory and then writes DxEPDMA and DxEPCTL.EPENA with writel(), whose
barrier orders the earlier stores before the MMIO write. On a Sophgo
SG2002 (T-Head C906, DWC_otg 4.20a) that is not enough: the core still
finds a descriptor that is not host ready, raises BNA and disables the
endpoint, although the descriptor reads host ready, last, short, IOC
when the interrupt is handled.

With a host sending TEST UNIT READY to a CD-ROM LUN as fast as it can
(about 2600 a second, each followed by REQUEST SENSE) and a 1080p60
H.264 encode loading the DRAM, about 0.8% of transfer starts raised BNA,
99.5% of them within 20 us of the enable (the latency of the interrupt
itself), with DxEPDMA still at the head of the chain. Without the
encode there was none in 254000 commands. BNAs per variant, measured in
turn on one boot with a diagnostic build, at about 780000 transfer
starts a minute each:

  unchanged                                   6215, 6510
  mb(), read the last descriptor, mb()           0
  th.sync.s                                      0
  udelay(2)                                      2
  descriptor written as two word stores,
    status last, dma_wmb() between            3728

Mapping coherent memory non-bufferable on the C906 did not change the
rate either. So the stores are still on their way to DRAM when the core
reads, and a load from the descriptor waits for them.

Read the last descriptor of a chain back between two full barriers
before the endpoint is enabled, for non-isochronous transfers and for
the start of an isochronous chain. An isochronous chain marks its first
descriptor host ready last, so that one is read back as well. It costs
one uncached load per transfer. With it there was no BNA in 6.2 million
transfer starts under the same load, and none in a 60 minute run at
1080p60.
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Read the last descriptor back also when the isochronous chain is full
  and next_desc has wrapped to 0.
- Read descriptor 0 of an isochronous chain back as well.

 drivers/usb/dwc2/gadget.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index a7eaf75ff..cd1773836 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -854,6 +854,27 @@ static void dwc2_gadget_fill_nonisoc_xfer_ddma_one(struct dwc2_hsotg_ep *hs_ep,
 	}
 }
 
+/*
+ * dwc2_gadget_desc_visible - make descriptors the CPU has just written
+ * visible to the core before it is told to fetch them.
+ * @desc: The descriptor written last.
+ *
+ * The core fetches the first descriptor of a chain as soon as the endpoint is
+ * enabled. writel() orders the CPU's earlier stores before that MMIO write,
+ * but on the Sophgo SG2002 (T-Head C906) the stores to coherent memory can
+ * still be on their way to DRAM when the core reads it. The core then finds a
+ * descriptor that is not host ready and raises BNA. Reading the last
+ * descriptor back between two full barriers waits for the stores to land.
+ */
+static void dwc2_gadget_desc_visible(struct dwc2_dma_desc *desc)
+{
+	/* Order the stores to the chain before the load below. */
+	mb();
+	(void)READ_ONCE(desc->status);
+	/* Finish the load before the MMIO write that enables the endpoint. */
+	mb();
+}
+
 /*
  * dwc2_gadget_config_nonisoc_xfer_ddma - prepare non ISOC DMA desc chain.
  * @hs_ep: The endpoint
@@ -881,6 +902,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	if (!ureq || !ureq->num_sgs) {
 		dwc2_gadget_fill_nonisoc_xfer_ddma_one(hs_ep, &desc,
 			dma_buff, len, true);
+		dwc2_gadget_desc_visible(desc - 1);
 		return;
 	}
 
@@ -893,6 +915,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	hs_ep->desc_count = desc_count;
+	dwc2_gadget_desc_visible(desc - 1);
 }
 
 /*
@@ -1079,12 +1102,23 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	depctl = hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	dma_reg = hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
 
+	/*
+	 * The rest of the chain has to be visible before descriptor 0 is
+	 * host ready. The queue is not empty, so at least one descriptor was
+	 * filled: next_desc 0 means that the chain is full and the index
+	 * wrapped.
+	 */
+	i = hs_ep->next_desc ? hs_ep->next_desc - 1 :
+			       MAX_DMA_DESC_NUM_HS_ISOC - 1;
+	dwc2_gadget_desc_visible(&hs_ep->desc_list[i]);
+
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
 	desc = &hs_ep->desc_list[0];
 	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
 	desc->status |= DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT;
+	dwc2_gadget_desc_visible(desc);
 
 	if (!hs_ep->dir_in && !again &&
 	    dwc2_gadget_isoc_out_held_packet(hs_ep)) {
-- 
2.56.0

