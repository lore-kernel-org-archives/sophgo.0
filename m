Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02362C08BB
	for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045944; cv=none; b=luAe+zshBO0XzBgx5tK40wg8iNNSI0F1M/NNrFp0g7VJDpraMhDFOIRR1PApOSEDET3VbRlVvuY37npc36M4jAK/L4SrWk0kB6xH/PwuqrDfshtgDzNrIah5jEVGJmUEX7yVtwSGYj2+Xf0EQkrWOSUffwXJuQKGFGf5HC/yivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045944; c=relaxed/simple;
	bh=Pcv0I515WGpSBtnjBoWfAF6yKVeQ1TVrn7bNULKjLFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRP9UnyzvDXT7wT3F6ZOSevl+xpJ2Nxz57lTntr+Ba67LmpbBL3+Px7Zr+Y0BLOs1+kUYxYzlXyLv+Dj+kNg6+n4SRYXNfWQ7iHiV0B7Pa/GJ45MEK/7vPe5hoMYyWu8a/pd7hEKgL/hNRkI0ZiWHurXxVHu0C9JNuzNT4LcZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J1kKQEUF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J1kKQEUF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a020e65269so31601245e9.2
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792045942; x=1792650742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=J1kKQEUFL91VPtuhLHe74JdqnWBvyKI28TlQeL2i+XNZwZLr2IAlalPXsMdtVKIdaB
         eLJawXY7sKctp6OBYMUte9xFPnb/qtJNY6fO6y1q2dtjwweD2rnPKHAu94W/PJ6Oi0L0
         qrFXabyb/2XNJt3GRwKdalDAYJJveUtaaWjqVNOthQhjUsiKQNuFqHHfqMdRdrLV2jXy
         a0Kr0FeMynqLg8k09BVonnAPCIW9qPBPL1eXiTDLisdNcI2VEDHNTnPaD+NfuP0Cp1nh
         bdB338CeTeH1ACkc9hM8Tn+c7dpriNs6ByCm2TEy+P9KePYEW4UkUuIc8FNS/53/1Xh1
         A4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045942; x=1792650742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=Imf8yw1wjHep6TntRcGdtvXry/xCMARlyFNundHwgOoyw3LuII5yLTaov/mBC7T5sW
         IlKtkTuAgEafYr5hy0R86ux+Ob64xXerrEgLE2lEMtH4z8dYaYj2+MyQliYvrKo9FaQP
         H4xcQEdGBlkib0zQoViMh28Iys5hUjF09sO1haafQQKCyAeRIX68Uq4df/x0dTA7Kt3+
         NEVES14QA6UsxZA0WOYok1Ib3ehmFDB9vcTOYMXBJOJo01cw5AdySRbmI/VXnf0oF1Dt
         4eT1zVnwOX8Hn2HsKoAI9q4PmV1vYZZX0WERv0ZK+/Cs0DhaHJe/YH8Rn2mOPWwbAfiI
         c5Xg==
X-Forwarded-Encrypted: i=1; AKwUvBz+ghz0QFxTG1KUsLled6ZA9CpsCu8Seraas6JikY5tuUTFK0cn32CMdE/7Z/GIinmJuurZk/Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYI6ZrNVGBvyU0Yppx68B5nL7fe12O3xQhwgbBwDAesBX9M1n6ea
	D/BmjDA3gsYpgpEHP0UG5dXQxDopc8S9Um8smL61zXFotwJnZ62FdOrQZvovOB0JwSuSmjdJyVY
	8IkjM
X-Gm-Gg: AYBFou38uEa0bbdQHDxbIs+gquvOEsQUCo80kn/PHElWsXCe8VleLtNe6h/ONtfATsH
	BNRqcuo4bntHiPGaPtatGaFGCJiRUzNmzHm6PrhdELfu2euOy8GMeES4iWC6fAHk+Lyl+zJppX+
	RuRTMGYTCDd8/SvRtiF/XIC6qlz3GhyB/Ep4s9II5YHWg9IY05N0aDqs5D6KVMAWBJjt68TWiB0
	7cc+l4ZTpIgV2aGLfnwo4Ic8jVhVAIWM/nxNcWp9wwjU0RZaKJ/nkV1ysWu/M7AKp6yWPV4umAX
	WW1hT9W3Qo/JacgzsCP0SQy/Qt9Xr+GiNrmQ1cKgxs79iio9ofXXSWS5Klf9uBE1Il6e1UTDyU4
	5nyGeE3yw3PaNeSiUgPTww7ugRgnlcLdHim/0lv/ZM+pcBA6Lwnpt64lLv//xi43cD7zr8kKedY
	xSAsj0gJJirXM6P4xVCR9PzTT4Bo+yN9VNCbmRlpCo+SBqWMRL+MXJs9wJyubjpBPNnOwpxRO1s
	PoLR/q351Vn8pE=
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a18e4a3ac7mr390482335e9.5.1792045942037;
        Wed, 14 Oct 2026 23:32:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1bd9a8a22sm52340755e9.5.2026.10.14.23.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atByyAg-c8v_IiAj@monoceros>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wqyi6vrkxoccpli"
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>


--2wqyi6vrkxoccpli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
MIME-Version: 1.0

hello,

On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> pulls in a looot of dependencies this driver
doesn't need. So please drop the latter.

> +static const struct of_device_id sophgo_efuses_of_match[] = {
> +	{ .compatible = "sophgo,sg2044-efuse", },

s/,//

> +	{}

s/{}/{ }/

> +};
> +

Drop this empty line

> +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> +
> +static struct platform_driver sophgo_efuses_driver = {
> +	.driver = {
> +		.name = "sophgo_efuse",
> +		.of_match_table = sophgo_efuses_of_match,
> +	},
> +	.probe = sophgo_efuses_probe,
> +};
> +

and this one, too.

> +module_platform_driver(sophgo_efuses_driver);
> +

Best regards
Uwe

--2wqyi6vrkxoccpli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQc3AACgkQj4D7WH0S
/k6AXAgAiAV2USgEzQOtvljyc8VbWNuSTr9JlXOIb2McAei2yOxSLalBc1rFQsSh
Z/UTyGYma1+gCD0MWFS1n4maltg+40KzZAzEwnGc7REEcSdkOYpss26bTQRHj4r8
R8DCErxJRfj7+lKnoNtLgK0hz28wPFBIp0YSPyCVkbQJF8N0hl5NhmR6cp+RykDI
u/DFIl+DUwm9fpHVxvTBWsHdigv8+CQ0HKLesoqDLD0RyTFiA3MMqg/g0cyA7qAs
6gqYBGn1ZjmuXbiAdTslU0ASU0cHgIthGhMK1IxTlwrU3MErYG35z24LQGMxeL88
Hz3oIY6HAz9ZzGxGZV38TB+eQMPs6A==
=jQo+
-----END PGP SIGNATURE-----

--2wqyi6vrkxoccpli--
