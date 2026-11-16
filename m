Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812686;
	b=QuqQRDALUNUgsGmhz9D11m8jGBgqU8qhDokmE6Xgj6WF/0+fzYKKHdNAFhPf3l7v2O+b
	 40kcbv3xIvx9T2m8i7KH8S0C1wO2T4tTFzB94W5cH7fiJHPS73JZ79utzd0UIuevMj4Wn
	 i7HbEzvumHvt68i5VJjtKTjexeBMDJg9qF1pj88wTamF8YbnTRwzbyyHQyjcbFQ/r1soP
	 eN/H/HH4T6BacVDBu+XFVzd3v/uPFPC0Vt0qgGPWZbpBhkMhVg6QVJlRnEHQWCP4vUBty
	 UiKMMJtYRilz4gniaU5jU10H2XmUbi9zJ1ExXuAegww5yqAACJkm50HiKDafOclxlYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
	b=1j02xmPc38iNWeVIJdZpPcT+FpRkfMqNf3Vk+BvEEOm/uLjY8q4DJUx+OS/9oKB+XoN5
	 kevHjYC2lvQRyy8dh0kqlBQlunCWDKj7gcGuDTvzw03o3a5/PKHZtVwmP8pCVcPjM9YBl
	 DcRtdI6VlavT2H67JDbKap0Tw9mXrOTGPpqG/ysw3HiZGSxsH/uXUojAY98Kz0yb9DPse
	 +igaJJ1DtnK//C6YaEeYfIwM18sGsd0ymCP+wbykn9zZS3NHNiydeWf1pPhX8sxQS/2sB
	 VM5grl7v/RvhTGonX2bUYkoyhBDlortfObtqe3UGFGfSJPMFLrUoePxf3cm+e9IjVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=CB4jgt3s;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C52606A337
	for <sophgo@lists.linux.dev>; Mon, 16 Nov 2026 07:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C52606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=CB4jgt3s
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so3621323a12.2
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 23:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812683; x=1795417483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
        b=CB4jgt3sRWobvN27YPRuUA3vpsFQQnfsHB55o/1ZsDLPbRbiRJVdzZ1WLgNM/20RcW
         m3At7O4BzyuCSn1N7YY6v+dl7b/0FD+W6+ieiaM+eZQeoRsDc7e86oiXjz8VQofQ4igG
         vp3qt03lYGqGe4MC+Z0k2ClG0+3DhJ3SavD+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812683; x=1795417483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
        b=15Gj/2jYUlrqeAgeHeDuQvYi1gHEvMQvYCVY4T+5voxuRXto8OX42ki4P0E6c6XLa4
         SzfiVoPaIcVD3c5+2nwxIVikGLwQPWoQjqgD5TGT2pO8503zQowCc2XtfciPi5EMpME7
         5B4MPuxZXlAYO/Xk9/1pNc7T8srej1uTto046PMEJAsMtXZ8f7xvxjc7TgixohZiIzD5
         Xq1GRE/qjMOkKrJ1FKuIhLm6XKZ/Vk9W0hexyULfFfrRR+OjYkMEmxNqz3+0jVR5cEF7
         ZcPEYXaDJHoqEl4sO3YFJxCNPDv0HxyJVx2Vdlnv2N6pft+A0QwtXRLBwGzxdvdeTZI7
         bt0A==
X-Forwarded-Encrypted: i=1; AL+hErHAULI7Gj8K7vHbAjiSD4XNY1pcWlngGym8hhbF4FB+/uIk0TU2fJ0F8TlcEq3PSyXXCJ3jqfM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+s2Wa2Bd1z0ryFcciFva5pKb/kBcBMb5Jn7S4mLi1QLMUu+DPx
	w1ZeqiIBvfVo37gY8rr+GnIiUsNq43Ik1g1juMeX0MdLJgAYQZ9CM544Nfo/BSx1s3o=
X-Gm-Gg: AYBFou3KzjnGFlwCqrYBxZV3AaVatw7cihMfyDJoRRVU+4Ug10zK64VWPu+Ynvmwfey
	5jimluoX55lwnwuBrMb9aRol1zM3Fvn0+BmpHR4NyBEX+ZJBzDmObz5K05+m7p0FU2P858CtJzR
	wuOiL8HFyQCAwz7x1JoR3lq4IIXVlUzL2naL4fjRToQyW7xRqnRkFJK2s7sMSjkzkSUxLy5ng61
	8B76+b/C9avNqi09JaDyvMnXDYJ7W3UERpcEUNAh/zasTpi9QRcCw04zhEtxmQuQjPZSfzjToRz
	YokwaEKg5MKavKqTyDIS3q6pgDf7UziwLQW2N6vVakV7n2Xx0ZlVAzyqDs7MjHAIHmNlyUoTbNx
	xDNevxqWAzSg0kLfSdg4HDSmzLAF2um19wFN3qloxlO69CJSt9c4j+GO/TQxKoq/WhwVOsxeKh6
	d588Xmt//AENv20WsYtRy5g1b+w3dv21Y/xYJd8A/ywf2S6htuB02EjhDnVTEAERyq9Iy+YPTCE
	qg8yaSTsu6pru51YIA0yJyh+8f36HcU546D0SMXLKu13yoiLwlCSJxuRdVlEAZjIs/zx/Gg5ANy
	VXC4I72zET457uBXuhT+suL+gG24jERJGkZ6WD4abSiF4CNB8lKy3HRfd/9w5Xj0ToqM+Gq1fQM
	JxQrxBzBo73ZX7Pzv/ZhHY0rrVsSrnV+TDEJ79DHbATqFVLQLeSkGX5ZTeUXrJsfYOWn56KYWE5
	juka78swVswi/ypg==
X-Received: by 2002:a17:907:c14:b0:c4c:999e:e6f1 with SMTP id a640c23a62f3a-c5096418d9emr738864866b.46.1794812683241;
        Sun, 15 Nov 2026 23:04:43 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:42 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Mon, 16 Nov 2026 09:04:31 +0200
Message-ID: <20261116070433.2813951-2-vadim@yuzi.co>
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

In descriptor DMA mode the core stops an isochronous endpoint when it
reaches a descriptor that is not ready (BNA), for example after an
interrupt latency longer than the queued requests cover.
dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
to the next OUTTKNEPDIS. On a Sophgo SG2002 (DWC_otg 4.20a) that
interrupt does not come. The core keeps the OUT packet that met the BNA,
shows the endpoint as disabled, and tries the descriptor at the start of
the chain again and again, raising BNA each time, as fast as the handler
clears it.

With a UAC1 capture endpoint and eight requests queued, one 8 ms
interrupt latency (a line printed on the 115200 baud serial console)
caused one BNA. The endpoint stayed disabled and the BNA interrupt kept
the CPU busy until the host gave up and reset the port, which took the
other functions of the composite gadget down as well.

An endpoint-disabled interrupt after the BNA makes it worse:
dwc2_gadget_handle_ep_disabled() has an isochronous part written for
buffer DMA, which completes requests frame by frame and advances
target_frame up to the current frame. That moves target_frame off
TARGET_FRAME_INITIAL, and the OUT token handler then takes the chain for
running and never restarts it.

So restart an OUT endpoint from the BNA handler, and from the
endpoint-disabled handler when it finds the endpoint disabled with
requests queued, and do not run the buffer DMA completion in descriptor
DMA mode. IN endpoints keep restarting on the next NAK.

The restart has to deal with the packet the core holds. The core takes
the descriptor at the start of the chain the moment it is host ready,
before the endpoint is enabled, writes the packet to it and then stops:
a chain that is enabled after that takes one packet at most and raises
BNA on the next. Traced on the SG2002, a restart that just rebuilt the
chain and enabled the endpoint gave one BNA and one restart for every
packet from then on, about 2000 interrupts a second, with the audio
mostly intact; and since the chain is filled front to back, the core
took descriptor 0 while it still carried the L bit.

Therefore keep descriptor 0 host busy while the chain is filled, write
the chain address, and only then mark descriptor 0 host ready. If the
core takes it before the endpoint is enabled, wait for the packet to
land, give its request back, and build the chain once more: no packet
is waiting for that one, and it starts like the first chain of a
stream.

The BNA handler must not flush the Rx FIFO for this. The FIFO is shared
by all OUT endpoints and nothing stops the host: when an OUT token
arrived while the handler ran, the flush left the core with a FIFO it
never drained again. GINTSTS.RXFLVL stayed set, every isochronous OUT
packet was dropped with OUTTKNEPDIS and no XferCompl, and bulk OUT on
the mass storage function was NAKed until its host driver timed out
and reset the port, after which EP0 did not answer. That happened about
once in 100 BNAs here. The flush does not drop the packet that met the
BNA either; the core delivers it to the new chain all the same. So
drop the flush.

A BNA can also arrive in the same interrupt as the endpoint-disabled,
OUT token or NAK interrupt that starts a chain, and since the core
keeps raising it, one is latched just before the restart and seen
after it. Handle BNA before those interrupts, and ignore a BNA for an
OUT endpoint that is enabled, so that the BNA handler never gives back
a request of a running chain or resets the endpoint state under it.

Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Handle BNA before the endpoint-disabled, OUT token and NAK interrupts
  in dwc2_hsotg_epint().
- Ignore a BNA for an OUT endpoint that is enabled.
- Keep descriptor 0 host busy until the chain is written and the chain
  address is set; wait for a packet the core holds from before the BNA,
  give it back and build the chain again.
- Fixes tag. Changelog rewritten for what the trace showed.
- Do not flush the Rx FIFO in the BNA handler: with an OUT token
  arriving meanwhile, the core stopped draining the FIFO.

 drivers/usb/dwc2/gadget.c | 168 ++++++++++++++++++++++++++++++++++----
 1 file changed, 152 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05f..8adc90047 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -900,6 +900,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
  * @hs_ep: The isochronous endpoint.
  * @dma_buff: usb requests dma buffer.
  * @len: usb request transfer length.
+ * @hold: leave the descriptor host busy; the caller marks it host ready.
  *
  * Fills next free descriptor with the data of the arrived usb request,
  * frame info, sets Last and IOC bits increments next_desc. If filled
@@ -907,7 +908,8 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
  * status.
  */
 static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
-				      dma_addr_t dma_buff, unsigned int len)
+				      dma_addr_t dma_buff, unsigned int len,
+				      bool hold)
 {
 	struct dwc2_dma_desc *desc;
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
@@ -956,7 +958,8 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
-	desc->status |= (DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT);
+	desc->status |= (hold ? DEV_DMA_BUFF_STS_HBUSY :
+				DEV_DMA_BUFF_STS_HREADY) << DEV_DMA_BUFF_STS_SHIFT;
 
 	/* Increment frame number by interval for IN */
 	if (hs_ep->dir_in)
@@ -970,6 +973,52 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
 	return 0;
 }
 
+static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep);
+
+/*
+ * dwc2_gadget_isoc_out_held_packet - let the core finish an OUT packet it
+ * holds from before a BNA.
+ * @hs_ep: The isochronous OUT endpoint, its new chain written and descriptor 0
+ * just marked host ready, the endpoint not enabled yet.
+ *
+ * A packet that met a descriptor that was not ready stays with the core. The
+ * core raises BNA, shows the endpoint as disabled, and keeps trying the
+ * descriptor at the start of the chain. As soon as that one is host ready the
+ * core writes the packet to it, without the endpoint being enabled, and then
+ * stops: a chain enabled after that takes no further packet. So wait for the
+ * packet to land and give its request back. The caller then starts a new
+ * chain, which no packet is waiting for.
+ *
+ * Return: true if the core took descriptor 0.
+ */
+static bool dwc2_gadget_isoc_out_held_packet(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_dma_desc *desc = &hs_ep->desc_list[0];
+	int i;
+
+	/* The core takes the descriptor within a few bus cycles, if at all. */
+	for (i = 0; i < 10; i++) {
+		if (READ_ONCE(desc->status) >> DEV_DMA_BUFF_STS_SHIFT !=
+		    DEV_DMA_BUFF_STS_HREADY)
+			break;
+		udelay(1);
+	}
+	if (i == 10)
+		return false;
+
+	/* One packet of at most 1024 bytes: the DMA takes microseconds. */
+	for (i = 0; i < 100; i++) {
+		if (READ_ONCE(desc->status) >> DEV_DMA_BUFF_STS_SHIFT ==
+		    DEV_DMA_BUFF_STS_DMADONE)
+			break;
+		udelay(1);
+	}
+
+	dwc2_gadget_complete_isoc_request_ddma(hs_ep);
+
+	return true;
+}
+
 /*
  * dwc2_gadget_start_isoc_ddma - start isochronous transfer in DDMA
  * @hs_ep: The isochronous endpoint.
@@ -982,6 +1031,7 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 	struct dwc2_hsotg_req *hs_req, *treq;
 	int index = hs_ep->index;
+	bool again = false;
 	int ret;
 	int i;
 	u32 dma_reg;
@@ -989,6 +1039,7 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	u32 ctrl;
 	struct dwc2_dma_desc *desc;
 
+restart:
 	if (list_empty(&hs_ep->queue)) {
 		hs_ep->target_frame = TARGET_FRAME_INITIAL;
 		dev_dbg(hsotg->dev, "%s: No requests in queue\n", __func__);
@@ -1003,6 +1054,12 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 				    << DEV_DMA_BUFF_STS_SHIFT);
 	}
 
+	/*
+	 * Descriptor 0 stays host busy until the rest of the chain is written
+	 * and the chain address is set. After a BNA the core may take it the
+	 * moment it is host ready, see dwc2_gadget_isoc_out_held_packet(), and
+	 * must not find it as the last of a chain that is still being built.
+	 */
 	hs_ep->next_desc = 0;
 	list_for_each_entry_safe(hs_req, treq, &hs_ep->queue, queue) {
 		dma_addr_t dma_addr = hs_req->req.dma;
@@ -1012,7 +1069,8 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 			dma_addr = sg_dma_address(hs_req->req.sg);
 		}
 		ret = dwc2_gadget_fill_isoc_desc(hs_ep, dma_addr,
-						 hs_req->req.length);
+						 hs_req->req.length,
+						 !hs_ep->next_desc);
 		if (ret)
 			break;
 	}
@@ -1024,6 +1082,16 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
+	desc = &hs_ep->desc_list[0];
+	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
+	desc->status |= DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT;
+
+	if (!hs_ep->dir_in && !again &&
+	    dwc2_gadget_isoc_out_held_packet(hs_ep)) {
+		again = true;
+		goto restart;
+	}
+
 	ctrl = dwc2_readl(hsotg, depctl);
 	ctrl |= DXEPCTL_EPENA | DXEPCTL_CNAK;
 	dwc2_writel(hsotg, ctrl, depctl);
@@ -1491,7 +1559,7 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 				dma_addr = sg_dma_address(hs_req->req.sg);
 			}
 			dwc2_gadget_fill_isoc_desc(hs_ep, dma_addr,
-						   hs_req->req.length);
+						   hs_req->req.length, false);
 		}
 		return 0;
 	}
@@ -2259,26 +2327,66 @@ static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep)
 	}
 }
 
+/*
+ * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISOC OUT
+ * endpoint again from its queue and enable it.
+ * @hs_ep: The isochronous OUT endpoint, in its initial state.
+ *
+ * After a BNA the core keeps raising BNA for the endpoint, as fast as the
+ * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So the
+ * chain is restarted here at once.
+ */
+static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+
+	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
+	    hs_ep->target_frame != TARGET_FRAME_INITIAL ||
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
+	hs_ep->target_frame = dwc2_hsotg_read_frameno(hsotg);
+	dwc2_gadget_start_isoc_ddma(hs_ep);
+}
+
 /*
  * dwc2_gadget_handle_isoc_bna - handle BNA interrupt for ISOC.
  * @hs_ep: The isochronous endpoint.
  *
- * If EP ISOC OUT then need to flush RX FIFO to remove source of BNA
- * interrupt. Reset target frame and next_desc to allow to start
- * ISOC's on NAK interrupt for IN direction or on OUTTKNEPDIS
- * interrupt for OUT direction.
+ * Give back the request that met the BNA and reset target frame and
+ * next_desc. An IN endpoint starts again on the next NAK interrupt. An OUT
+ * endpoint is restarted here, see dwc2_gadget_restart_isoc_out_ddma().
+ *
+ * The Rx FIFO is not flushed for an OUT endpoint. It is shared by all OUT
+ * endpoints and the host goes on sending, so a flush here can hit a packet
+ * that is being received, after which the core no longer drains the FIFO.
+ * The packet that met the BNA is not dropped by a flush either: the core
+ * holds it and writes it to the first descriptor of the new chain.
  */
 static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 {
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 
-	if (!hs_ep->dir_in)
-		dwc2_flush_rx_fifo(hsotg);
+	/*
+	 * The core disables an OUT endpoint that raises BNA and goes on
+	 * raising BNA for it until it is enabled again. So a BNA can be
+	 * latched between the moment the interrupt handler clears DOEPINT and
+	 * the restart below, and is then seen with the new chain running.
+	 * Leave that chain alone. If the endpoint is still about to be
+	 * disabled, the endpoint-disabled interrupt or the next BNA restarts
+	 * it.
+	 */
+	if (!hs_ep->dir_in &&
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
 	dwc2_hsotg_complete_request(hsotg, hs_ep, get_ep_head(hs_ep), 0);
 
 	hs_ep->target_frame = TARGET_FRAME_INITIAL;
 	hs_ep->next_desc = 0;
 	hs_ep->compl_desc = 0;
+
+	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
 /**
@@ -2902,6 +3010,27 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 	if (!hs_ep->isochronous)
 		return;
 
+	/*
+	 * In descriptor DMA the requests sit in the descriptor chain rather
+	 * than one per frame, so the frame by frame completion below does not
+	 * apply. The core disables an isochronous endpoint by itself when it
+	 * meets a descriptor that was not filled in time (BNA). Put such an
+	 * endpoint back in its initial state and build the chain again from
+	 * the queue: at once for OUT, on the next NAK for IN. The loop below
+	 * would move target_frame off TARGET_FRAME_INITIAL, which tells the
+	 * token handlers that a chain runs: the endpoint then stays disabled
+	 * for good, and every request queued again goes into a dead chain.
+	 */
+	if (using_desc_dma(hsotg)) {
+		if (!(dwc2_readl(hsotg, epctl_reg) & DXEPCTL_EPENA)) {
+			hs_ep->target_frame = TARGET_FRAME_INITIAL;
+			hs_ep->next_desc = 0;
+			hs_ep->compl_desc = 0;
+			dwc2_gadget_restart_isoc_out_ddma(hs_ep);
+		}
+		return;
+	}
+
 	if (list_empty(&hs_ep->queue)) {
 		dev_dbg(hsotg->dev, "%s: complete_ep 0x%p, ep->queue empty!\n",
 			__func__, hs_ep);
@@ -3151,6 +3280,19 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 		}
 	}
 
+	/*
+	 * Handle BNA before the endpoint-disabled, OUT token and NAK
+	 * interrupts that can come with it. Those handlers start a new chain
+	 * for an isochronous endpoint in descriptor DMA mode, and the BNA
+	 * handler must not then give back a request of the running chain and
+	 * reset the endpoint state under it.
+	 */
+	if (ints & DXEPINT_BNAINTR) {
+		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
+		if (hs_ep->isochronous)
+			dwc2_gadget_handle_isoc_bna(hs_ep);
+	}
+
 	if (ints & DXEPINT_EPDISBLD)
 		dwc2_gadget_handle_ep_disabled(hs_ep);
 
@@ -3208,12 +3350,6 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 	if (ints & DXEPINT_BACK2BACKSETUP)
 		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
-	if (ints & DXEPINT_BNAINTR) {
-		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
-		if (hs_ep->isochronous)
-			dwc2_gadget_handle_isoc_bna(hs_ep);
-	}
-
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
 		if (ints & DXEPINT_INTKNTXFEMP) {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

