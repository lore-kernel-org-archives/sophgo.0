Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9E879E1
	for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749765834; cv=none; b=bXzAcCbByIxeLGAIPAK/dhbGheGOr0b+OhAgjwK8iVnLrBUgGqpHkXJMdM4QxUbD4GM5EU6G0rkmza+kMOxwJq5CaI9OoF08BSZOUxrKRIVzSZCqxeTlNmwRrGk/T0m+I9f2lGjtGea45axSEaWwgtoyofToKDjih2LcB5B3b1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749765834; c=relaxed/simple;
	bh=4/krhPPyShofR2SJXsJFmspVM1JoGVteQkoWvO0lb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRbdPgEM4hi1ROjzWYcegrmLfA4xA2zXgZ/iTlje65o6vHy0B9HWg/hM78rX18nldo2/yiI4ODtMrd5VY1FQqWfq8sLWScacBKfplLT9vT1d25UBZw98bZgTIpJrCfx6UFAUaB1TtnswXzLIZoz3f/IpX/YmorbGlR8Xvwzqf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3YLbaCK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3YLbaCK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so1354092a91.3
        for <sophgo@lists.linux.dev>; Thu, 12 Jun 2025 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765833; x=1750370633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=g3YLbaCK8PPooXpBjH92BckK5RVNKB8xglmH92vNFUr/dkhAQKz7r58sY+E+R6eIjQ
         IDFdgnjEtva5hulwSHPXpankZ2PTogwcxTClA0RtAdrXYGeVAL/3HN5pZ15A9kjAnSc8
         x6fnvrkPoyfa/SHBs/Bmcz89lH9KUofQsAFBZVmjKtrMfwM4biyvhXL7fZsxfZcn0bcA
         ITWXjnhizG6eD1whVDaE0tj6eVorOQosp/zQRznSOSE6ZGhgQwkxa9ZJ76J8MS/iiDmR
         gt7W2jaNHLbJu5zOGG9plLcvXf48nO3bL1UPQL+WtJhuE2q/9ljk4xFh5OA8m+pumepv
         OlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765833; x=1750370633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=Pktsqqo3F/GmscL14NqWvPzXsMrYJnoxl4oLrlY+lsPaVMOWfK3UjUmgYJ3EAVkDrF
         DYTwz3Q5Lm77pCbJqZM/aYrWWQvP5VJz1wRG4GBD8xF0V5SCo6IhNDl1pPUhh2xgJf4H
         iyo/gJ4Cu5VM7DLLteKBpc6TZyKR16A/crXPO6N0gzf9F2yc9FoXsrK4U2FhPRskAi3a
         1feuOpM0TPDkak5iMsRl/Rzjr/cLIDNVodv5d+itM08tCc9WWDjP5STl7o9XsU1TM7sT
         vLz8w6IdieCpnqmksz7p2SmWVtBYxNZeFGPYDyYgl7iMJy33Pix8FlGVnGtekLa3n6w0
         jPmw==
X-Forwarded-Encrypted: i=1; AJvYcCWYmCdL1H6WXP84YQb81pH+ifvFILjRTISeNjhatlUOYvMlowom5AZU435WGFgTPWMYvMu3o7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDE4VrCQjvdJy8olCFije92DdVaM9Xcuor5Z4CATcG3IB5v/mJ
	te+QmYypnDdcZ8lseNVfkGqIfdleYRhYSMkk/aEFQq2yRqz8gXBP19OW
X-Gm-Gg: ASbGncuuI3rib9H92xsIUz8OQVgjfU5iAYGN8u1alqPTWq6L/pOlyIE8kzKYLNEBelW
	7OtzCq9rqddOJsQ9oqHHTVyCsQLiBYKEuWre9iy+JmVHnb1zg2CuRtbW1FNyQnIzqC0cZfD3uwo
	XqEHu2olA4HhU+7kcsGYLAXHwoaMtRL6zzgpvBq4Ji4KKc+isX0b+VKo7bwrwquZix7DR4P5Ge+
	JsashavdcO+aUBlCweqgcg3xUU21oZdh7BHcSUoMDVTbBgTISz996Ss/vhqU6K1dsGCX2lxsDNn
	clUxho2QNvlnUBC017KoAV501ARpYOpOnH+hLiM6Kmz1GI0FPNsxzN1VeJq3
X-Google-Smtp-Source: AGHT+IFEKNLfpOAGCxAJGsac/EYqmS3wSquQaG49ddE1q1GX7taDoBx1GaZvDLzKHooYzWdOVmZGkQ==
X-Received: by 2002:a17:90b:264e:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-313d9e93c27mr1088783a91.19.1749765832654;
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365deb04a6sm2077235ad.178.2025.06.12.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:02:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-siesta-verbalize-6a7768ebc648@spud>

On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > "VBUS_DET" to get the right operation mode. If this pin is not
> > connected, it only supports setting the mode manually.
> > 
> > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> I'm having a bit of trouble finding the v3 etc, could you provide a
> link?
> I think what is here is sane, but I want to make sure that review
> comments on previous versions have been addressed. "dfn:" searches for
> both driver and binding filenames turned up nothing.
> 

The v3 is
https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
It is a long time ago when sending these patch.

Regards,
Inochi
