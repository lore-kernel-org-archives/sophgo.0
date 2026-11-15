Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768824;
	b=beG3dIQ4LFNgagew4Pn0BpE1kq/u9UyBtmApx9NCaYDAq3n9+Tj4OdJthZ9Ho6D6nDCh
	 TrmVrfjbD6cEleS8elNRdjXNbSFGkgb6/pAV63zPkZzxz7KQQgB7s/HZgxkMMDXi62N6b
	 1vUKcc3jA0UngXJb1QWuluNGHhkVI5fJBV13OcTRT/zKcoeH8nPnRccf+BiyHDpJX5Tjh
	 f6/m8/kq0dsu3uMj43wQe28pZ0quKfPuOpdSAIgiKuFSTBsuVuXQwRYOXR65y2zx126nf
	 diqOMxken6psyC/gKpJtjDvmPyxgCFVzKlqZ6LrCt2oWGnOda9frtD5CBInkHAKVe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
	b=w6SBIC2iY+FDW/E4nQnqAdTt3a3JNS/7wBLlAuQqBTy8Yq53hFO+uxOD4//x+koiYtpG
	 s7Cp17w92RlP9J+m578diioS0Rzh+V7Ygu1P5m2v5UdOcKksB6gbmwc4XgTSTtMuof8Xo
	 mRJWCio/58MJcEmlPedxCzN6jfuOFzvAY8mlhClwDkogtyAzcJURY9MJ6xFVqmXyo2nCn
	 DqZErwp6SH57kkrzSNn/gnvPO2oxh0P9Ju4kBjnhTqNuXfXUsqg9n3j188iPUn5OrML5m
	 xIsousZBJy4oL46qeQCJH2ZWHbRvz6qbAYw9G96aQRmGMlm+akI+Q6WE7DCUKWhuflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=DQfiho14;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38979606A32C
	for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 18:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38979606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=DQfiho14
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso13655355e9.3
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 10:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768823; x=1795373623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=DQfiho14rcHrH24Dj6XK18El19dN/JrRBoOWKR5vrnPFO5g2UlUjYbxHl3zez6I2lM
         f4AkQxqiXkTiq12iu2YXV9mUJacAhEw5nOLd5sDWPXrjlVCKPOYiXhvBIhLqCwLayAQc
         vpI6aJhpZoxFL13XfQr1Z67CWK4hf8D81Camw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768823; x=1795373623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wx347V0wBMRB+bdi/iEwLISPCRcjrM0Qbh9hQtRy44c=;
        b=xXpkZ3B6eZi48CrMji/qyrkUYZ7i0AjtQYNkQsnSpq/aAtjlCzcag1zdQGtt3cUXMF
         VFAvDOn44NETrV/0UreQc8PC1ovDEt9W7kMoqZENMpslpws1qfd4B+/HOnnpGgEeLdaB
         vypGxjAgYG8LyhuNYijf88QNywYQoXmsbR4MgwAotwgBqvT7KQ5i07hjUsgol8hJaSvE
         7NAYLCo1BSRNsR7U4vJ1nzyQLjaXOvIlJEhpcNO04prORL+640xk6on+1DUrFElzmujD
         RhhVYNGhX5x3+aAy30GdU0TpglOjtddm7vBk4Zq6klLkD3R2Qvf4mt7PAkwkqsG7wlJa
         S/eQ==
X-Forwarded-Encrypted: i=1; AL+hErGcXx0P7J5WqNmRqavG6jokfR9J7T6xYL3OTGuyAeVddNnJya/ZX8xVXMPk/a1P7zIw4wJQga8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Uy1zQ03gIOpjq+owyNWRcTICdlxA2nB75mdb4XTxaHP6DVv0m
	pmvPgfdlwwrBXDBYhb/XfscwvMagQkclxobaNTQCQYEkjLrh4EswYA1sryuL6NOod3k=
X-Gm-Gg: AYBFou3vFlgG3ZAOgQdhSxOUEuKFxpZ/9ELkEEoZgCKGlYpJl13psfi0+wN6cZhCxaD
	Pq56maDa6JfdMy6MQiUqcjb2pP7sksiNVhwLWbDDwIzj4zz7Wm2IbGQOVM3wpC1ibvJvHBbFV+D
	B+tC4dNLAYdaMhYeoI+hoReGF8HPl1ZEf39zsgbl6zrM3DMpBogZ3uINqQFnTbfW0y5sAfl5JMx
	3s4Hw5EPpw3h2WUG9pxBFs43Ry8flfHbnIQd73asWYWYx5eZKPv9PWxK/g9R9Svpkg+2GkxoZsj
	l3SFAUhhEPnbpFf4q5hTh0ebDRvaFu1A2xmZnyn9+oKs6E4FhTQ1NVVQVJHHAkcLQ1dOHkmnrW1
	dRKeiBSRVvo0G3PV+3eqfEUJIdYE1PdwTEIqNtAQX99SEZs+8KjgbjI3QHwIpiznVoVusleqNha
	3OJQABuksydreLZ8CuMhwlK7WwokMpZPDXxZe/rjzZfVqD8PISdEJPNUMhOvbRiPcWvhhP/Nul7
	gug+6aRT8YfRltAzO5j+UyKD92NqhgwT+nRQ34yKm/LyjOneKzrqUs1U+fboxTQ5rBVSMb1rsWh
	J4w/L+oEFw8Lfs4pwqlF/AGWEwNmWqVtFJqA1ZX8uuabNI42T3QJzqUQ+cNfYTpJ0JBPY2UKflD
	21MeU4VLWbM/m1R0/rAq5RTEWNSe/R1/cSe9zossHEYc9M/ORKn5QgopioVgsTzHdlFxWSaXpu0
	gJYS4Ve3EgJ4axPg==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr80230305e9.8.1794768822690;
        Sun, 15 Nov 2026 10:53:42 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:41 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Sun, 15 Nov 2026 20:53:33 +0200
Message-ID: <20261115185335.782678-2-vadim@yuzi.co>
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

In descriptor DMA mode the core disables an isochronous endpoint when it
reaches a descriptor that is not ready (BNA), for example after an
interrupt latency longer than the queued requests cover.
dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
to the next OUTTKNEPDIS. Two things keep that from happening.

First, the endpoint-disabled interrupt that comes with the BNA runs
dwc2_gadget_handle_ep_disabled(), whose isochronous part is written for
buffer DMA: it completes requests frame by frame and advances
target_frame up to the current frame. Run after the BNA reset, it moves
target_frame off TARGET_FRAME_INITIAL, and the OUT token handler then
takes the chain for running and never restarts it.

Second, after the BNA the core raises BNA again for the disabled
endpoint as fast as the handler clears it, and no OUTTKNEPDIS comes.

On a Sophgo SG2002 (DWC_otg 4.20a) with a UAC1 capture endpoint and
eight requests queued, one 8 ms interrupt latency (a line printed on the
115200 baud serial console) caused one BNA. The endpoint stayed
disabled and the BNA interrupt kept the CPU busy until the host gave up
and reset the port, which took the other functions of the composite
gadget down as well.

In descriptor DMA mode, do not run the buffer DMA completion for a
disabled isochronous endpoint; put it back in its initial state. For an
OUT endpoint, build the chain again from the queue and enable it at
once, both after the BNA and after an endpoint-disabled interrupt that
finds it disabled with requests queued. IN endpoints keep restarting on
the next NAK.

Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
 drivers/usb/dwc2/gadget.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05f..b0e129061 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2259,6 +2259,28 @@ static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep)
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
@@ -2279,6 +2301,8 @@ static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 	hs_ep->target_frame = TARGET_FRAME_INITIAL;
 	hs_ep->next_desc = 0;
 	hs_ep->compl_desc = 0;
+
+	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
 /**
@@ -2902,6 +2926,27 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
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
-- 
2.56.0

