Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768827;
	b=ZN0Av3FOCpZgfPD76JiJ0Syd6NYLD/N16gXjXj+c5reMSOZKgaimqUMJpzzhkRUe45sa
	 nEhR+fRLUia1a0n75noxz3RiSAjz+swgLx/iSeMVa007wXOYQQMLC0LSWrcR72Up0cxZy
	 yzZdczIOTkIPCkqUa5uITkdA3330uNmpcD8B3u/WeCvSMo6ahp8jeXrTqqW/mQohrQKb7
	 v2fezYINRluiqYzRdIcgUYEUdXTu+P6+qpxYKK36Dyi1oo2S3oo3zEuOqn6fa2OxOf4T4
	 gDnA6ows2yWLfqQCGN7G7za2p1D+xwV+PwTUPojoBDroe3uJngB3AIcUCmeH5Jdc5MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
	b=uhaNQHMXYZ0n44pWiUXRA1fCzLSXdqwve3LF/xP4x4KO5bEVkPDis1ONMet1xY2Z94m6
	 C+xdMm4RNRgpTWrz3YXZWzOEBuZtRbbfMjivfKwoNSE8zb5u+OnRLcBzf1sd5c1Z9tq7/
	 Z9FkKavw4+ayvXTjU+jfZq91V1zuoPdyUhXUf/vGqUanT9ej8FYhNddkJZYc4PHgWnSqa
	 lNQ9Et8vy+GXKHTd1DOvWh1gf9qP5NrKApaJhVR6v6upetGh8UVc4GgBaO+a7rfHnSqSx
	 uR6iziewNEACXBygZjaa6+PaTNwaqZ6pDTCncWGPrbbgHiVUIm5hKWrWCn76yQgRq7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b="MIL2/69z";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F8606A31E
	for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 18:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 050F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=MIL2/69z
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4910b863b84so2083924f8f.0
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768825; x=1795373625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=MIL2/69zPsKaLufCwH9R+IXiIdgPwItbZTjFu90iiRdhbdLsuzv7EAwWLIrweDIZuA
         MXRzXcJ1T5XJQ83+qtEhP3zruJ47sz2/Rntk8pXnFeqlPXw1k8Ud7k6DEaGyKCHtQBnT
         MZHXRbK7vie2aoLSu2H5Iij7L1/Op1qYkUkss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768825; x=1795373625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRhuQlMYzHQu/cSsivJpIzm9mt/nTPkd+5XFG9V8Aww=;
        b=p1MBY7VUK78ppLGn6laGL5BL7isYirp4wwjchyBzHRb2FJcT8Ej7lPkk7pWvdRc8HA
         3gn9vt8wlmi39gVAvqdDm4k7reg3h7/v+v1s9fwKPagXKy+w8cNKZIABBSXD6/ZNPBoc
         C2DFee8ieGGgerZS2OKstj92JKxRX5Uh0I3KxdJ3ucef4vR/uvyMHx/UN8rHef/+iOMW
         4bnAiLnNvGsnKjCdc6YT6s1/viXp9vyk+1VtMHADPi5K0x5g1+aRYdTURvCWbs32FNNd
         JRJIukFLM7P2rW/Dp8kvDaMb59Oz/VBuWyBoWjCTLsn/QyjXY3ol4NI0001N0t73+YAb
         xWAw==
X-Forwarded-Encrypted: i=1; AL+hErHC/NjM76/JtS5Q0IVXraVkKjP1fSzHpRl/ulm6AYhAnaaAuVma4apbg/C8SxcTmekQYZMw8Uc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8boxcrB5nMspbty1qwH27J5WW1f5XlqcAF4BAgb5lML/VRpKJD
	JP6S5P62P2/KzxnZ1jViFB8GEQ4kabtKNKjrLSsJv5Hmu2vdvY7q5OrYPEtwMK/Nxw8=
X-Gm-Gg: AYBFou2oqG+yVau6pUv8BV9jMxFwSSywOdiZek4P84rTUsT7ER88kUSDSMiczw4jnny
	DqymtHIogqRfT7GGGvq+OxKwaHVdreE1ZnpfGCbeWuIXxMs25S1CAYtZUS4GfFGSQpmogjJEySy
	0CCVmw/uu6zu1gz4VHKpehCzBSpqKjbKgtSJUmf5x991eDkmkQiRFKj7DMyD7l7oNq33d7+PmVb
	LMsrZirtplqAmDXXjDuT2Kpa3JVU/y3v1m+VFLHZ06kfLvN1v3Q4yKI5IzVbNEcP0tJ+I3qqJVH
	KrI6o+K7qVgoAZx8l/wmizASTFtU13xypIkhmVCH2146hLGDdYPkqG2b7JKo/nGd8H1PhaVuKJZ
	FXyoDNBHLPzUh6/D/D/gySZ/bqvlnfw+bJlTp8h/aFDKmOakua4vyGqAKnDpQTfYw8OaKkuc0m6
	Q48gqxHBEJ3HUAYsAWFkyqp0ztY9U/1KiDNOQrAWd/Hsc4TlXGEp8XtRXmTmEGr+02rmJKwq5GD
	AUtIzrS3jFPZ99iLfDcomtu/JQPrxWggjf/inDI1QPLtQQiOuGT80wiDGgTk9agv3fNLbU0fZT7
	GjL6bLqdg2I5s0iSB6HgX/YpeObSSYqdpNF2zLRgJ7xvAOMafOsInMmUurTGV6tytdID4BfsTcs
	gbDGYP7vRocr+72XL7UbeXIFfgNlkbP52vL5D/KKMeakJqlXVjgq7FFhvsS3sJCt/eigh82Usfu
	8A+luo9kKAvApZlw==
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr158238605e9.12.1794768825374;
        Sun, 15 Nov 2026 10:53:45 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:44 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: dwc2: gadget: make descriptors visible before the endpoint is enabled
Date: Sun, 15 Nov 2026 20:53:35 +0200
Message-ID: <20261115185335.782678-4-vadim@yuzi.co>
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
the start of an isochronous chain. It costs one uncached load per
transfer. With it there was no BNA in 6.2 million transfer starts under
the same load, and none in a 60 minute run at 1080p60.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 046b5b045..fe37250fe 100644
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
@@ -1021,6 +1044,9 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	depctl = hs_ep->dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	dma_reg = hs_ep->dir_in ? DIEPDMA(index) : DOEPDMA(index);
 
+	if (hs_ep->next_desc)
+		dwc2_gadget_desc_visible(&hs_ep->desc_list[hs_ep->next_desc - 1]);
+
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
-- 
2.56.0

