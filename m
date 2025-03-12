Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C111F0E37
	for <sophgo@lists.linux.dev>; Wed, 12 Mar 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741822195; cv=none; b=avEXRzjF1aVbGb3aRFVTTamUvS4O836r9TvWeCqRngVcoK17t6GIan68mv0N720T4tOk8aR6IFxaRoZzf3wpWnSgLPCYppcPo/r9+Bxgj/ygBawArAPdm1Zp9OhNDHQihr/gJ8yRHWYAMVQ+v3/5OusQxN/CunrZFVf/Kv4RCDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741822195; c=relaxed/simple;
	bh=fspsdGz14WdzOajPJOMQzjs2D+NwwiVnmRowuuxUM58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkVFywtgFj7NpXzG9yeAHu4eocrmn6jP8C3TbXCLscTXuIjB74ApQpR6THqvXQs8+I975nsl0I9Zgw8xW2cctnGeQsDYtyVZW5tVun/gQy8XHELVFg74+lp+A8/2NV8JC2dKaPU5mxuiPYxq/YMtoBnYLsmWwKr81m3cCX5Osrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke6GazGZ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke6GazGZ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c554d7dc2aso45408885a.3
        for <sophgo@lists.linux.dev>; Wed, 12 Mar 2025 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741822193; x=1742426993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLfGaIgvY5ZVl4JrSGdwM0o3tslIHB1ct9yF4dQRXlI=;
        b=Ke6GazGZpmkRrl1oZ/1EboyJAWMZRw7u+v5UQyidGjzZVcvIONBO0QoV97CrIW8s0a
         tQ7UdStEJLkwidXXhaRJ7e/UbnESgEQnYygKvXfvwmjRKN8YBiVkCRLldp9PK5nEeTp2
         Q7oDAO03D+wNYqdkx1mkj5KQJx1w59AxWGp/ap8TqICMkO/15X+35ei1Na1ExQMCo1GR
         ftIZ+Qyl2UHn/A23M+6v79OAW1MtjAuBMBVXVJuNot87rukQHn/je0hFLmv6k801Vk8+
         kz9uM+ezAc8VB1+I0GBuz7pVtUTAZCxo5ok75H0kzfYVRsWTUD7CbhUgF/XgDYmlS+4h
         1lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741822193; x=1742426993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLfGaIgvY5ZVl4JrSGdwM0o3tslIHB1ct9yF4dQRXlI=;
        b=ANw/A1yWCmls6nqutzIhriLeu1+01he/R5OSqZ5PvczlQ+B+QTBUX5gQvJMu/NkHzK
         4AGParlJDsTz3KOJf9fl7DekKyhUpR2PVpjVUkcpPweqj3zh8VpqpmIUyaJW1rWK7Twy
         P6Gc3iRb0XFTyU25oVClAqzZQsnXd9YcJcWsbpWcN90J+7c3Dn0qG/aEfmI9/WzBXg48
         yZSfgSUSbsrxCsZbzRe2K6n4OgtynKSCSh9sPsvr1bKdidjTpFQvPv9ZtxADGhQW5WII
         rI1WM801xAg337r4sSMQ7CQxNfI5P5PPWHkfltulLziTi3DG00B3O9Pgme/i5DnBOL3r
         ccSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6jTGSebWeGmDycoZwE1pQObEfng+RiLQLiJciCRccK3DkVnw+ugaSSgwzO2PpwrAZ/OdvheY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxRwLt6FPbl4R5P37jP73g/+s6cBixsuC4E4pJ0+G45OoRQE4+
	wjgQ9zN2SNuI76jKs7uhrrd57kqcLgCj2PK2z3K8ehpWk8BzQixr
X-Gm-Gg: ASbGncuguaOL/QK061urP+Mccdruuu25fn6g4nFgjqTa7HJhDhM7pf4cRQzqxpK4t7W
	v2gVl8VBUvhor3JD87UV8CpLsg6hFoyR7erdL8SYv/jyKS+5t0JfUyvPUnEWc3SSHLhnjTsbKJf
	1lzvCrd67l/hbXQFvDSof0Ph3F+McgMgBpbG1p4/zbIEa4b9JTbWDXJ2gQL/6yyvkJByRbVVyPe
	jAeh/Rhg/99LKlbx2QF1SX1b2OUVsNEDvI9dzbF9PlcD+k0oyiLRYkTV8XBMHsRdTi0uSXst7hP
	FrhoCf07ZgjP1IlaNykX
X-Google-Smtp-Source: AGHT+IG2pfcqk2sk8gdrKSI0hu3y9BsjzCHFtgLXjVkzz57vH+f9YiHwGclAKa4AV4l6e21yRYMqxQ==
X-Received: by 2002:a05:620a:2581:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c4e6112241mr2951625485a.34.1741822192828;
        Wed, 12 Mar 2025 16:29:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d8aeebsm14867685a.103.2025.03.12.16.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:29:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 07:29:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: sophgo: add clock controller
 for SG2044
Message-ID: <x43v3wn5rp2mkhmmmyjvdo7aov4l7hnus34wjw7snd2zbtzrbh@r5wrvn3kxxwv>
References: <20250226232320.93791-1-inochiama@gmail.com>
 <20250226232320.93791-2-inochiama@gmail.com>
 <2c00c1fba1cd8115205efe265b7f1926.sboyd@kernel.org>
 <epnv7fp3s3osyxbqa6tpgbuxdcowahda6wwvflnip65tjysjig@3at3yqp2o3vp>
 <f1d5dc9b8f59b00fa21e8f9f2ac3794b.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d5dc9b8f59b00fa21e8f9f2ac3794b.sboyd@kernel.org>

On Wed, Mar 12, 2025 at 04:14:37PM -0700, Stephen Boyd wrote:
> Quoting Inochi Amaoto (2025-03-11 16:31:29)
> > On Tue, Mar 11, 2025 at 12:26:21PM -0700, Stephen Boyd wrote:
> > > Quoting Inochi Amaoto (2025-02-26 15:23:18)
> > > > diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
> > > > new file mode 100644
> > > > index 000000000000..d55c5d32e206
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
> > > > @@ -0,0 +1,40 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/clock/sophgo,sg2044-clk.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sophgo SG2044 Clock Controller
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > 
> > > No description?
> > > 
> > 
> > I am not sure the things to be described. Maybe just tell the
> > clock required and providing?
> 
> Sure and point to the header file with the binding numbers?
> 

Good, I will add it.

> > > > +  - |
> > > > +    clock-controller@50002000 {
> > > > +      compatible = "sophgo,sg2044-clk";
> > > > +      reg = <0x50002000 0x1000>;
> > > > +      #clock-cells = <1>;
> > > > +      clocks = <&osc>;
> > > 
> > > I think you want the syscon phandle here as another property. Doing that
> > > will cause the DT parsing logic to wait for the syscon to be probed
> > > before trying to probe this driver. It's also useful so we can see if
> > > the clock controller is overlapping withe whatever the syscon node is,
> > 
> > It sounds like a good idea. At now, it does not seem like a good idea
> > to hidden the device dependency detail. I will add a syscon property
> > like "sophgo,pll-syscon" to identify its pll needs a syscon handle.
> 
> Cool.
> 
> > 
> > > or if that syscon node should just have the #clock-cells property as
> > > part of the node instead.
> > 
> > This is not match the hardware I think. The pll area is on the middle
> > of the syscon and is hard to be separated as a subdevice of the syscon
> > or just add  "#clock-cells" to the syscon device. It is better to handle
> > them in one device/driver. So let the clock device reference it.
> 
> This happens all the time. We don't need a syscon for that unless the
> registers for the pll are both inside the syscon and in the register
> space 0x50002000. Is that the case? 

Yes, the clock has two areas, one in the clk controller and one in
the syscon, the vendor said this design is a heritage from other SoC.

> This looks like you want there to be  one node for clks on the system
> because logically that is clean, when the reality is that there is a
> PLL block exposed in the syscon (someone forgot to put it in the clk
> controller?) and a non-PLL block for the other clks.

That is true, I prefer to keep clean and make less mistakes. Although
the PLL is exposed in the syscon, the pll need to be tight with other
clocks in the space 0x50002000 (especially between the PLL and mux).
In this view, it is more like a mistake made by the hardware design.
And I prefer not to add a subnode for the syscon.

Regards,
Inochi
