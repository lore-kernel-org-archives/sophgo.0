Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119432;
	b=CctNMWlNSnaPMRFDNULBgbjt2xITOyCZ9QCWyeD3ddJuj2jWSO+rXZNhqDMNcbzSplTA
	 ySKWyUpJqxeFTw0ccbJuhBSf2N1dg69Al4S71KnVg+mM11891XfKhesTLowXZx5nSnPEu
	 dKJmSJc3zjnHNPbIVeW4vZVkBOUdxfm9BpTQdctQaNLozRGkUHrUj1WYNIxxz/lJe2jqG
	 +9ctC2sGKY0nuWzu8M+6f+bLzxbafkdB39raEIjyWtkJKLOpjiBy2jNOheOXLHjF6l8yq
	 wfZ7f3HlM1bNCt4g6u5w9BLYslb/Zz6ttG5rzcelNQbX8/wHVHUFixMchw1tR14iZ+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7Aw/1/KyTmy0RsgTCySlOKZRBmB5Uz5cxcB13/REg2s=;
	b=AXy9w2Z9AVu/5Jxl4eFVR+QWWdzzIwgdNY0x4eMPRIa4DRu7WVCL2eF4fKWKj3MRPVgp
	 mXBZZN+OAdcaj+mhxnBw8X53fKEaTxG+CU5JYcrJYN516FE3CXKGCvgTynoEGgzBoYkYt
	 Aeg7yBRvpZcvT1NkG48DFnl4pOF91Anj2jKVufqCxoN3hJebgsSEY95NKf+bmsDe1v73Q
	 /a+6H/nv0j9KDFlnbNPp7h0eRkghZ7rVWkdRFBnAVGD5Eh5WIGrcF/2Kbu9kvXmcA5wYr
	 hEyGWscQeoaAPvBtZVRP5NkLLAAKyo/eOLR1zw1LodGDhHMyVYXlCvaz5Z2CYUNjlaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXDmyrc7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE1606A31A
	for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 16:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kXDmyrc7
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab1cb6eb70so5329161fa.1
        for <sophgo@lists.linux.dev>; Tue, 27 Oct 2026 09:43:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119430; cv=none;
        d=google.com; s=arc-20260327;
        b=KVXrkxd2cTYNPC5pXRQHAos7Le3zFRpa7PgoWMfUG5lqVYFQq2adddv8rJvY4tB2ms
         NXnaRZLmi+O60AiolMvtjWxRrTYBdvhpWEyzkzNdbceWnNIkdUj7yso3T4yVF0gfioF4
         8m8IL9jC7d7pvxylojozn3QFbW857ZrYY5e3G47oUMtG0bS2SKXWedCXeQgSVd4Ki2i8
         DYcPbeT3TblUtt+mkHd0dLb0z532ApOPGfWLFXJSRlloLVf1ZrfE0au6cEBsQ/4saFDw
         UP+fz8vKfCMLyRI/iEo60hcvVgraT4u7qmfgqpY1As5CFjOmej7lIO+Xt3KdUu6uk5iv
         UUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Aw/1/KyTmy0RsgTCySlOKZRBmB5Uz5cxcB13/REg2s=;
        fh=PsJ8YW3KIKwJHmDHLHka3TWM8c/3T4F4PR6DcQNhc/E=;
        b=sTXJEED65EfHVAZGTbbdOejcZUBPvqe0gb6KXsZdDsFuTQdIVOUcsXZnB9L35B1lIZ
         HQYv9SA1cTKpvPaKg23MaCBIbQXTBcd945bwL6whpBHY8WNPCNZK9LMistW9CyHZeFeI
         EXpUEUKy1sS6svBfBK3Eid8bt1Ra8OMqRMhJAcUMif17WcwYzpdwSOU1LDOZcRSTUQIp
         /87jzAEsllaxaqJ2EmTvTc6UYZ2ScNaZfZLYIpF6t2UGF8291gsoo6pkqInn9tc05Ltl
         CY3CznDBAxPi8i8cSFJs6mLLCrpHFY3Cm+vPJ+WYbX00PLoNLNqSAoT+dbX8cj++XetF
         o/cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119430; x=1793724230; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Aw/1/KyTmy0RsgTCySlOKZRBmB5Uz5cxcB13/REg2s=;
        b=kXDmyrc7oq0NDfb93lDj6T/UBy3yZoVudyyoml69R7+DQ1H8nHjaaW1gRXh83QXBfq
         Bp2HIBdOamFskFSg4xFZHcdD4CWcn1zU8bHn9kKrBzBuYzvkeLP/exrwoT3e4352nGkL
         hFOYhvEKs/h0ympdoYkpRNTAa5tcfKDhn0hMkKGZluhAx7rF94s/aNuRQ3bqZl/2fXIN
         zXuy0oKkYi2Z/mBgHmVXxKBBQjE1Q48jM4wmjdMTvJGCe9wgKApZoUphfZ+D62vteUIJ
         B2edwp25AZweXeoUJ8OfAlmyrk0+X3kk6xEqgiyTg9biObL64wvgNO8h6NFk6DpjuF1+
         QPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119430; x=1793724230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Aw/1/KyTmy0RsgTCySlOKZRBmB5Uz5cxcB13/REg2s=;
        b=TZyZTtxndNvA7xznPDqc6KYHA3XQfR/zvPUE9KoJ5IeSwzZkvSimaDNPC6suF21snL
         y6yKHEpLl+3JFOMkw1YJ69o7MSPpapAHgyuRzm6W/Ud85YjAEN2wYT7Txux5qC15PZxZ
         vwa6M9W+wt/DdMAE4z6GKQ4xUA0czEER5JUqXyjUP6v1i11Esy9sXqrA5LgvcEKPdNRG
         Ej7LGc4u+zwAt5csNLhb3fuJwMH4fy+ZNumhJkwENMFM4mo2wcYgRQhyhFWTZ5rcS3Uz
         ZXbhHx3xnZJiXbHcCMeBiQyB/8dU0UjreiikFpyPmNfeHsOr0hfXdMHGCBS4IZd0XeXY
         ozBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBDTESUKiHNL01oyg5J1z37tYeT/gnTSE/Q0cFnylxXGTrL/bF8qO9NoUheOfdPptciqJuqns=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQBJ85s7RW9Dr/hEMULMyRJFz5elcXvBa3B8IdNYz61M7xU0Ar
	PhzAnEevJmzhsfiA96G1emqB919AA3N5O6zDp9Deu/dcEGdPQvQsO/0lODFGzgPLTXXtk8grb9o
	f6y7wo2Yjfcf/NPBo/Ah0YPWMaaNNqVE=
X-Gm-Gg: AYBFou1LaWW2C0wWc7oLPZm8juK261cKwjswhZzaHDoLZa+BtjFkwqXlFh5YyltojAT
	Z03/CT7fxpbNyQCybglCSbFJklu/w0+MHLo55N/OIp9CNqe8QB9IgXnSDg6gJWsQmY2ZbKUEcLB
	XvTE58gEz8hmQyECF6ZIpcDV+gSmMl2bhmPP1NFnpIfR/Avm4n/9iyrC6yTaPUCMfUhmwGNBIyJ
	wIQlXGTZmibKp+VS2l+CcfGyDX+fxJe0y4KYpnZywGeLg40uCCLHNBTTLuO1kjfxU/CeK/8CDB/
	uIvG7ThywRdDT/yYAcLWf3ck+jDz7H2UAV0c+KvPm/9TolqNke0eTorqsMa9L6nzqIfXxkNKDtO
	6E3ArEHln8AzMLgilZwYk5hqgofEKbs+JEZbjkzLO6iEydlHMmuOawgjIIB5N3Qo6jOHFmu9Wdx
	huj5u0TXhVo3nZbWj4CxU=
X-Received: by 2002:a05:651c:43ce:20b0:3a1:b658:fedf with SMTP id
 38308e7fff4ca-3ac6fcb07c1mr20239911fa.2.1793119429838; Tue, 27 Oct 2026
 09:43:49 -0700 (PDT)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <at09avHegBuX6Evc@inochi.infowork> <20261027073626.975104-1-chenyou910331@gmail.com>
 <auBkJSpC-H_HQ9xK@inochi.infowork>
In-Reply-To: <auBkJSpC-H_HQ9xK@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 28 Oct 2026 00:43:37 +0800
X-Gm-Features: AclHuK_3ibpYYy5httWpdptsJioLroUJOcDVzmX3cFVGO2ojVYKcMQy1-lKMGWI
Message-ID: <CAKspUhJsotrZZiDcMUj14-JKyobJE2ddtocWFBBm4ra3AJeXeA@mail.gmail.com>
Subject: Re: Milk-V Duo 256M: USB peripheral mode works on mainline, how
 should dr_mode be handled?
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <chen.wang@linux.dev>, Hiago De Franco <hfranco@baylibre.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Inochi Amaoto wrote:
> In fact the dual role switch can not init normally, it will produce
> lots of USB error in startup if you enable debug information. The OTG
> mode for phy need a hardware signal and the document is kind of messy,
> I think it may need a line to trigger it.

I see the same with usb-role-switch. dwc2's drd code switches roles
through the GOTGCTL session overrides. Once B-valid is overridden off
while the core is a B-device with VBUS present, GOTGINT.SesEndDet
(0x4) fires back to back and the board hangs in the IRQ handler. This
happens when switching to host, and also at probe without
role-switch-default-mode.

I don't think an extra line is needed, though. The vendor kernel
switches roles only by writing the ID override in the top syscon (0x48,
bits 6/7, the same bits phy-cv1800-usb2 already uses) and lets dwc2's
own OTG code follow the Connector ID change. With dr_mode = "otg" and
no usb-role-switch, doing the same with devmem works on mainline:

 - Duo 256M on a PC, switched between device and host three times:
   every switch to device enumerates at high speed as the RNDIS gadget,
   every switch to host disconnects, and ping over usb0 works.

 - Duo 256M on the IO board: after switching to host, the hub and a USB
   stick enumerate and sda shows up.

The remaining problem is at boot. usb_add_hcd() sets the PHY to host
during probe, but that Connector ID change is not handled: the core is
in host mode while GINTMSK still has the device mask, so the port
interrupt is masked and the hub is never reset:

                  at boot      after toggling the ID once
  GINTSTS         0x05000023   0x04200021
  GINTMSK         0xd0bc3cd4   0xf300081e   (PrtInt: 0 -> 1)
  HPRT0           0x00021403   0x00001005   (ConnDet pending, Ena 0 -> 1)

So I'm working on a role switch in phy-cv1800-usb2 that drives the ID
override, sets the default role (peripheral, as in the vendor image)
when the PHY is initialized, and keeps the controller's phy_set_mode()
from overriding it in OTG mode. I'll send it once it works on the board,
unless you see a problem with this direction.

Thanks,
Chen-Yu
