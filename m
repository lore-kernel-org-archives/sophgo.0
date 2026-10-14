Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A73FF8A5
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000163; cv=none; b=YeOEkXz7gahZJfKSgNagIqCeIQuvHPuaMQ3oWnUZKkQ3M/I5B8SfCHFatTgSHrpGhMoKSo/pOtEOEvmsSjovOTwdW9yGisrISfjXzQLdfzmv1oD6en3Opo2eaD348Z2t+8xjQJmu93hoWtcygA7tHCXBJMRu8PtANFwt51eK31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000163; c=relaxed/simple;
	bh=BGXYcyYxa3zL7lmoVTo5LwRWdRsUGemgsedWrQRhnGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Md5jSW/0TRH1md4M/2BZpicZDLH5VDShNt6AD0n/4PGzJlEp8RHFlzqOVepOSHFk4vHkbD8tVoYGiOPwcj2oxlHSQIzNKecu4KVcPZev0GO/I9IfUD9/3OrbXvp+lYOsnm7U67fIDwVM9Cvae5QN3bo8fGASiOLGgRCN9lAmFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=emlqJXnW; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="emlqJXnW"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e23be41cf8so2065456e0c.2
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 10:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792000160; x=1792604960; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8kzZmMj7iTn0G7hnvHiCslW4uHhA/2DjEeib3MziLQ=;
        b=emlqJXnWFaFLN/Xjc3C/ao1Go4dvabQ+VBB86lCaBOcu4kN1z+yJLm8liHL4T+r17r
         lcdxRuzhiA64jYLJSQ3NsxVfGi1shTucTdUf6xdKmkYNnUYDOf8LYpJiM9qzpGMNc4FE
         QHt5mKX66+UU2So/sxYmze1puecIVoEvG6ux7104t5zvSIzZKP4PhzVtvKEQMO9/G7/J
         IYK3MFLIjst/gQj3R4o6pKi3ZXsKeOXhmixTm6PsCPFaFOOJQRKkGF2Ee8mKbFMf/2ig
         qjKCMK1xKgxZoNyzn3xUhHj60+SNcEefTxfbzueqibRt7GKCOsc2iuZRaDFGeHi8y8Wk
         WFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000160; x=1792604960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f8kzZmMj7iTn0G7hnvHiCslW4uHhA/2DjEeib3MziLQ=;
        b=N0k2OiwDw7KQyKHrNvAPiHHkUoBN6lnSxPOdLPcSqND9rXKOXehCFEn38eFraZ+7Jl
         aqMPfzUsMh7vjFDevgGQv7C3MwlhIqUt5eD7uDQczqVfZzDHW8oZoP2J/XJiYhc6yuNI
         v7+BBFzz+EV5vQjJ7zB0ED0pTSPjVef8vorIUFziMQvg34cYrMaXz3K496ys8PZUAY/G
         HTe+ZMFMbPJm3lRtu6mWqnvkgedtu25OIUkNsKIre4zF36BLdyWHkDYGdxrEG552iEgq
         10MvxiCGsgqe7Mmd4/Rj1u2e4y6fCODDfaIxmUJODJrLJLcMgI2VBvsimXsYiPM9yqja
         SJEg==
X-Forwarded-Encrypted: i=1; AKwUvByRquzFuXdvnxNyOKjZ4exFO5jJhuRwP+nRF+EGsmUZ9rP9hyQbx9t6AqJ5TanI58w4KD3Nrcg=@lists.linux.dev
X-Gm-Message-State: AFq9FYIA1W+/bj+5xzLpjcnxXh2ZBloxj62RixSv/eKSLcvaEvtpXHAG
	pO29TIoNzSKcZRzGaf0NBnoU2y4OA0ymJ116PlA22wdR3rSDeOE+BcHUX+CoPWPKln8=
X-Gm-Gg: AYBFou0kk4p2ElvVZM7RL9ROBewdSNkxCiZjGfus564cIobqrj8FLJnYldZgtYKok16
	Hq/uwQKEv1GeK4rW6EiFBwC1hLhTWAYHeio3HV6YTO06vCvqwHLzecQ1nTRLWzjCJzHGch5vTXf
	30l9tgx+xImx9oJDwAVo9Wz0r6TPJUbnXXTM1nOtVjwT2ln4gBoqc8tFwH8itQqBeOXe7GMENgM
	fiXBn3mD014p87kobkZwwDTn4FHjPgIV+TFtO2QINZpod9B6xR5V5MrEYpl0MV+LliZxBJQMq5G
	G/ZpEca/sS6W8WUEETHR2xO7iRDjZpQKlvwu9UmV3rjbJWEmvQWzsghOkk1kG3jsRKItLSiCh84
	86O+KGmfBJJO/n5M1pDmo6ZwpnbTnZ/L/PoAQaHM9B4+Sl6+WHakEGCObRQpJqYMJn4HZidfHj2
	TUQsLmbYoBPDkfzBkrNagoxKLvI2eL8Hbt8nEqOrXD6YVrofGKD3aCY/zTTVyPYXKMyhwoZcu45
	vITUzsJS1n4mcFDwVaL4/inhXPSPlql
X-Received: by 2002:a05:6122:8006:b0:5e9:6d96:a910 with SMTP id 71dfb90a1353d-5e96da64d4emr837634e0c.3.1792000159744;
        Wed, 14 Oct 2026 10:49:19 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf5d1fsm11720814e0c.14.2026.10.14.10.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:49:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:49:15 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>, sophgo@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
Message-ID: <as-_ZlweuKWU1dsc@hiagonb>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
 <as802eClIH7MpxBR@inochi.infowork>

Hi Chen, Inochi,

On Wed, Oct 14, 2026 at 10:37:01AM +0800, Chen Wang wrote:
> Hello, Hiago,
> 
> Oops, it looks like I missed your patch. Yours was for the Duo, while
> Chen-yu's was for the Duo 256M [1]; I conflated the two and ended up
> submitting only the one for Duo 256M [2].
> 
> Since we are very close to the merge window now, I don't plan to submit any
> further PRs, so your Duo patch will have to wait for the next cycle—I'm very
> sorry about that.
> 
> Could I trouble you to rebase and submit a new version after 7.4-rc1 is
> released (this also serves as a reminder for us)? We will then include it in
> the PR for 7.5.
> 
> [1]: https://lore.kernel.org/linux-riscv/20261005093749.645014-1-chenyou910331@gmail.com/
> link
> 
> [2]: https://lore.kernel.org/sophgo/aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev/
> link
> 
> I've removed some people from the email's "To" list, keeping only the
> relevant parties to avoid disturbing too many people.

no worries, all good from my side.

I will rebase and submit again a new version after 7.4-rc1 is out.

> 
> Regards,
> 
> Chen
> 

On Wed, Oct 14, 2026 at 03:56:02PM +0800, Inochi Amaoto wrote:
> Hi Chen,
> 
> Instead of taking this patch, I wonder whether it can be converted to a 
> generic DT overlay file for all the supported boards, so we won't needed
> to merge many duplicated patch for it.

thanks for the idea. I can think about that, but in this case the other
overlay for 256M is already on linux-riscv/for-next, so after 7.4-rc1 is
out I can think about merging both overlays into only one file.

> 
> Regards,
> Inochi 

Best regards,
-- 
Hiago
