Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9B2957AD
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202391; cv=none; b=hPJS+IGvdrwSvuDGE8iGEEcYmo80IpLqlnYe9KJpWIC7cSIHBO/tOB3Ai4MWAc/hJQZbkuU5C+71Z2CmwtQmsXfq9TUjzaKRhAeHS0y5n0c7/+zphuxhXKlm8/CYuzunlmcbzaMx/e+plMKDwS6CxrDtsO4FRtrSVar1U3yLmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202391; c=relaxed/simple;
	bh=72RiHssNvDFQJNQq4LIcMB+q+Uc4lLwzNNUsDHHaPag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cESDcWhSvygWSHNC/DCYRSg4YmXynRCJ8UbHV0Ps7TuDa+8qF2VxQaJgeKFFdRs9WDV719BNA9UN7lIP7HqFc0IeJzt/1778JYJ1gTu46ovianGPFYa3shEbq10Dp+B6W/oYO3QP3H0O4Ft/fgnHXwRx7KluMV/yAT6XSfscGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIQcsFH7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIQcsFH7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2360ff7ac1bso44363035ad.3
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202390; x=1750807190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8kqTpESSgpiUk9q9r1gwFAkl1Q36FcCmMv3qMR5ZJs=;
        b=MIQcsFH7mbKwpXRFU3ItLH8bpbE/DeveVJqYJk3fzIPGVZCXISzXqWgqebs0nJx3ww
         soDsDZPjPSOXZrXv3ZuhsUz9pw+PJZqkwxU7DIvMFr9Ruu9hxLBgCUIWFMTyQWwxKMA9
         QVqs9sBzBEHNFavh9ignBL9BLnqUQiOunUNKRKDAqa9vz0OUj+1pc7gZ2I2ypnjZqYJs
         nhnerMxy/P1z/VdrbCT1o05C8occpphubZrmudD4ECOkxHAZ51LfRTDnXibuU6tRN7sP
         uJNHVPdlMcnw+U80/OHcapEniNtuAGqKnfMQjm6YlowRVIILDn5XV5Uk/765Z4NtGMOe
         +2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202390; x=1750807190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8kqTpESSgpiUk9q9r1gwFAkl1Q36FcCmMv3qMR5ZJs=;
        b=MYNFL4w634sWbPirXuKc0PYg0TC6SbMHnID0w4/il2F5v9KVdvH+bxphGV1EBxdu/K
         KCI6Te3NRWkvdmL5TJlOlmaHTRu4Owdgf5CO7TYUpfeRr6jyjdkBkKzHrqLuAafCsfU0
         JyVWXXx8MmccxmjF9MUHrMebdzRzpTDndZyqMPcBkAPUXPPIJb1mGxdxQirPy9V9O1Wo
         t83CCe3EU/OeGJaSLq99xqzPFdlXFHC4bQuhHCag+Y0HCNb2WlHE4bEsGWdJZFNNTTq3
         AOFCTcGRIiDwu07SZeasVABEOrTH6bBMhSqfSXYQpTkxZlkhIcOyn6f8R0X5R2I9EcZq
         PLqg==
X-Forwarded-Encrypted: i=1; AJvYcCWRuSQwby5nhaLXQ1HWhyNHutltSftp0ct/UtpQKoDVYKuswABZBnreyldFa6QGvQPAFxKCuVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzynD8pMDUePURFS4UPV5XJ4ccdQqbw+GyboIGC8MAVM59uLJaW
	eqh13A5oG2wXlhchWYTv/dyHD8HgHmcJWwoo5Bi0d5x5B/BjvAmqnEzQ
X-Gm-Gg: ASbGncvvPxFsCN2hGc39G29HwgIZbrClLrjT2NllqwhFroaupIqfYTqdxiHZTSIXbbk
	WmTw8wSEQDuU9SKbv3TB7ohoYHAapZ3CEZTUxBueLxE+m4AkO8uaqdfce9YOBZrt2kJzYePsWXJ
	Cl6i1DIEU0bHA3o2Tsstwi3iy7L0TTMSYxXjmwYJY4nCfPDvOhNWujl/LGwpvqC4Byx6mRAr2Xd
	F/srToePZSwQE2Aok3PKRlrqOi7GzR84YIYN4c557hgwBjkzZJfAPx60BYeL2dPdCga+IjGZ5QA
	s2THukKQYqELeSVBPp2bGNr8ruvHIWLKzyXc6243pd7iLwvmAgMoq1HRuIaVVw==
X-Google-Smtp-Source: AGHT+IHnlTzH8mh8gEyI3HuM9I4iPM9eqDaoTtYmvsv4BhKj8WV44E0nTVYmDn94/Ci0M7hmdQfhAg==
X-Received: by 2002:a17:902:f68e:b0:234:cf24:3be8 with SMTP id d9443c01a7336-2366b12f541mr253789605ad.28.1750202389638;
        Tue, 17 Jun 2025 16:19:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88c239sm86423235ad.11.2025.06.17.16.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:19:49 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:18:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <mig7k5zyhmata6uvjwlwlompwf22qffwvma2nhjww3cmsmxnas@y2t5ukucs76q>
References: <20250608224252.3902421-1-robh@kernel.org>
 <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
 <20250617130924.GA1678432-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617130924.GA1678432-robh@kernel.org>

On Tue, Jun 17, 2025 at 08:09:24AM -0500, Rob Herring wrote:
> On Mon, Jun 09, 2025 at 06:49:38AM +0800, Inochi Amaoto wrote:
> > On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> > > The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> > > path 'soc'. However, the correct place for RTC bindings (even if it's
> > > also a "syscon") is the rtc directory, so move the binding there while
> > > fixing the $id value.
> > > 
> > > Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > similarity index 96%
> > > rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > index 5cf186c396c9..c695d2ff9fcc 100644
> > > --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> > > @@ -1,7 +1,7 @@
> > >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >  %YAML 1.2
> > >  ---
> > > -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> > > +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >  
> > >  title: Real Time Clock of the Sophgo CV1800 SoC
> > > -- 
> > > 2.47.2
> > > 
> > 
> > As the rtc syscon has a sub function for remoteproc, is it proper to
> > move this binding into rtc subsystem?
> 
> Does that affect the binding (is there more to add)? Looks like an RTC 
> from the binding.
> 

I think at least "resets" property may be added for the this, but I am
not sure whether there will be more.

Regards,
Inochi
