Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685A48C405
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054791; cv=none; b=R+qiH16v5NnEGXySqi82CiZXEMCY4iPgViw5J1h9X5WNzr42I9o2KUTB0Vbttbq6HHc57SsMIiul/mArG4U0Pe6aKeC3FKE7qp0HGtIM/cz/DgD8cbk3YxQHiQekvodkKknYywNpiDmpQ51DzOgIjUerbZCDVoszmz5gwtEu4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054791; c=relaxed/simple;
	bh=3/cNw4sEvJBejOf977x2DG/AkG27qWXnWwL0GNmyl8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT5QdN/pE/AJBuDmOrA7njAJXQyWltr9+ZbDIHIPBpZEMvQD751ap90bPSP4jiNx80pX9YvjkVQDwISno6Oxw34B9FrffMBC5CjzBL6v/KrackdqYDD6A7BwV1GEVrDK1PRJ2+ttvuM42jiZlVLKDGkFmXBJ+wsHdT83Mp56bTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnwgA7tl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnwgA7tl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso21278375ad.1
        for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054789; x=1792659589; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=KnwgA7tlMKpJOqDs2avDroIfoZh2p1AISU8VSwNq65qWbDxbh1B7e53Lp+dA4J6rLD
         1xWdnEpxGYpadqUW+U0krc0QPUhYKpR6vcKxvsdl0Ea9xTlG28RCh6s54+25ZO4/Zki7
         XQfHmVoMAyaWZH4syBa5GJumBWL2WyjusisAjUA2CpgI+Wp6k6n2LuThisHvmCnFY/5s
         K/ZlLkCWsNvfSDRT6LKdyE2AQsimUZM6S/NbmSw+G/1rkbzJZv2+1CpuJi8Qh3rrnFcr
         odF1XkEyJe6bkDgIU1638KPQEDcHAtliu14mI5gg4ueg333qKeLKgFRss2EUjYJBc4gk
         Y0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054789; x=1792659589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=FS7W6ygh2O1kNDVlSzDXNVoFxc0EV48agrpEnxoC1WitOLD4O/m+lKiGKWObbGWg8G
         mzFx0/g2FlUpvWTw035iEeJcWGUbTgweeoncj4oA2rsnFMuOtMAxXJymFR1HlHWirqsT
         Dt6RWhJbkPl3KQmTpqbt5X/Rb/NUD8+fx/miBl293x6qUGMPiwWOH0iqJ0Ty8ApMsmRH
         RnN/LxyHNMAXcot6cQp3k7wQ0ugXnUE1iYfzocn1GKSOpHK0Z7ITrISjLGCVZb/jX0rN
         jGtRCSUqhM9DY9XpfNJi3teY2lrVSnyeySivA+Y0W28XPUm+5Je1zKPZoKLHgNNf1VQH
         et4g==
X-Forwarded-Encrypted: i=1; AKwUvBzbKIksgsa1G5zp3A0OHnjsll+YNFQUYKhmu1aku7FlySCQHoh5sxuStjIAlWcmXHKzGLyk5Og=@lists.linux.dev
X-Gm-Message-State: AFq9FYIGInUEfs0/PECcX6aIHSxyhXLPgKcPq8+Go6iIrZmvOBPjj5Pf
	Pr1B0W2HHRcGb4si53CkWU9j+rCQBTqRNz+7jyyAeLwSD+AQVBImLfh0
X-Gm-Gg: AYBFou22XyzPGWCGpWsZ5i05WJUn8YD/h1pmHIEsR9xMSwZbwYbZJ8Ruax/YKE6xyfN
	t4edK4NGhK/vE+exOALMk68nblxSRgjRRGeFYXwJNhvR4z1wYLgoGvP361+HKdtPriLoLMdXSH9
	IZsd34M2iuIt4j7CAkuhIoTsxI1Vq2H4CvaNptDMUAP4gBNAOtMnrZiaG6qfQVp40w3IfuctrB2
	7r2TsJGtEu+UJ6RoW/mtqCCXbtEJybK+lVDlfLsn6CAb7Pb5Kmr0uTp+geAbtkUfGPXJO6IpofO
	OWWmAp+J9o1FJBnHMC3GMwA+3OcibkT7KrOsx66lc5ghCmF//FGryq/GCF0mm/9Aze9VhcaSkD6
	Gfz7lyFw1FgF1Sc8UOeYCsk7CTK8ri5hQQQ+sxIr2m0g4hHb0x1DjO6QKDM3R1SyjmFzsdxZTIs
	aj2xMlMw8ZiEDTJQhf5CZBvCWWfNwls+UUzEvicsskzDuSXnd2wazkXDKrPVXgCR29NNlf
X-Received: by 2002:a17:903:38c4:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e940efea29mr41054965ad.3.1792054788685;
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95cf92dfesm5476715ad.11.2026.10.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:59:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCVyX1tV0VXe72k@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <atByyAg-c8v_IiAj@monoceros>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atByyAg-c8v_IiAj@monoceros>

On Thu, Oct 15, 2026 at 08:32:19AM +0200, Uwe Kleine-König wrote:
> hello,
> 
> On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> pulls in a looot of dependencies this driver
> doesn't need. So please drop the latter.
> 
> > +static const struct of_device_id sophgo_efuses_of_match[] = {
> > +	{ .compatible = "sophgo,sg2044-efuse", },
> 
> s/,//
> 
> > +	{}
> 
> s/{}/{ }/
> 
> > +};
> > +
> 
> Drop this empty line
> 
> > +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> > +
> > +static struct platform_driver sophgo_efuses_driver = {
> > +	.driver = {
> > +		.name = "sophgo_efuse",
> > +		.of_match_table = sophgo_efuses_of_match,
> > +	},
> > +	.probe = sophgo_efuses_probe,
> > +};
> > +
> 
> and this one, too.
> 
> > +module_platform_driver(sophgo_efuses_driver);
> > +
> 
> Best regards
> Uwe


Thanks, I will strip them.

Regards,
Inochi
