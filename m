Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD733806D8
	for <sophgo@lists.linux.dev>; Fri, 16 Oct 2026 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118073; cv=pass; b=O7hEWL648vDG2LMEmAxOrGzB27ItxRnoalcATG7pfTyLrw7C/pTr0mdwUkldvBEFciSQuUqix59I2hzs9nmABIWYB5zSGaByZ6kW2Htjpcigk9rVJLPNk10GQPZN5Oo19U+P+aGQOR/4RdAANvhVtkanB0k4LzkZlyCR6XdZYaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118073; c=relaxed/simple;
	bh=hgLBtvd7BfLBpiM4tfqc0TmFRq2ilV/ii1JBmucg8ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeoSCnssteKgsJIwMnhw72lPGxXYL/4ev1phbnYqTWChK3CzJn+1mwGeNXh97wXLq9Q3PzpL66JSbx61yR0WMAJs7PQQ3gnM3q7ZS2F2hNtZXFhT4rQwehoS/milKPmwSotJZ5iBSwNLKKqgo3luPMRQ0GctwUe+16sz3dpxrRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbZWcaTx; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbZWcaTx"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab1a37faaeso303361fa.0
        for <sophgo@lists.linux.dev>; Thu, 15 Oct 2026 19:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792118070; cv=none;
        d=google.com; s=arc-20260327;
        b=AfREi8v/piwQKXnKpiWNiig8vGv5nIB5lRSV69m+QR7VO8kjh/6ZmBFZPeoxCSVN4C
         6zccG28FcQMN/618+IK29d2m8aSr1SDZ8Y4+PStLqwdhj8g4bsWmYSu3EFkBtcxn7ODB
         TLRKg9luddiypdoMk4yDDIpx4eXRqGbkSZOmdtNclYTxnnuULbfdgnZ81shnXNc6uCAL
         /uOEunVayVs/C9hQnWqFuHRtECkXt5qPTovqd9ZYYg1EmN/Q8sRrw3pQBPPiw3AHVPRo
         HGtNdexVOODD/atchzHqq48cJusTp2rKGvCI943WMku0zMEv0yEBUvfu0vg+G36f18S8
         fHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5HUHSskvfD++CA7CJ2Oo92UADR06RLVcagK7UrPBuhU=;
        fh=QWc+wT4MCtQvlyW8/9wZ8abIjH3RYg/Ave8NsF+K9XI=;
        b=HsQw7NWRSs1enWT9ute5+fkg5lIn+jVmbZtFNUH2oEwmybEHx1RpzmUfmW+sVqAUdh
         pDRY5h8CY8uBIfk3pP9413Z6+yIyNQt2jE8qaZB+jb5EfmN2bmtBdrvJ1EtAtRpaur+V
         7Vi08oUFfrxYK+vVPpj80Ea23iDKcM9TrdexBSuBbLW6yGhsSnOlbS0Mird2OH9MHSOy
         nlT9WJ8sAX3TQQ/4xwMfJV8vB3oRhIUmFf/30BM7ZotOWeW5IRoUlfiKcEzm9duZMQNY
         DuJRIy9rZ8ZYT49nSNwKOENsN4CIbq2tYYenRMXhL04bzMbixpsgg213+bYqjH4KEuUM
         +Zqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118070; x=1792722870; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HUHSskvfD++CA7CJ2Oo92UADR06RLVcagK7UrPBuhU=;
        b=mbZWcaTxQ8kuGUPqqFw6gx9UaVjjj0lwVS+MkJGni3WRHyUXnNONOQvG+3xxMP13Zk
         WC17DRn5V7B6ddy/v7EjeukcRoYEsHShrpYdlNdfNoVKHAxLPZzBSynIB7+yPwOGBX+t
         Wnk9oAmluOqlxTphaVblQ806a4wMdDqmtbmf/KxNzHnUMibAMoovixyu2wqGb6bFjonm
         7bQBYi1SBlFATbqBipRSsBXLs8vVk/ehxf+i0bRq3Q5JJ5aRNM93KMyWIBHiC6JKBiUz
         5f1VPOOHGyyhBJmnA3DuO/G7jLNRfyvMoBfj6xtUCpQ9d1Eb6Oa4wADY8gwXByo9Gz2m
         cerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118070; x=1792722870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HUHSskvfD++CA7CJ2Oo92UADR06RLVcagK7UrPBuhU=;
        b=z6RXo3klH/LtBGkzMzlYrMTFmy5dGwuYHcFRc4Ap4ecDNf/hnacWRAKf4cRE9bGAqr
         qU119QrcgN/jJt9cgMmEnowYNvshqXF98jLMY4XqfGzqmphUYlglVXkY8NLfAd20M9iJ
         +dOQLG/cfsIuyARxpHYiI7LB/6v9PbbsWdSTFaJ4JohaD8glWRN2tBnDR7CN/iEev+A1
         +WOtm2YKcK7hVuxpJBmMytL2y6Rj7bGnpEU6LZsZ/K+y8XYrpu0rRcszSWDi+W6M9B18
         UfsVNMa3opJKNebvQte3YzSEG7gyhcHEaY7BwyhhvuYliadrW3vWvVYta8ei49jdp3yS
         N4+g==
X-Forwarded-Encrypted: i=1; AKwUvBzNodUatYgkcUqN3DFKCR+mhkjBHeYdWkHHhmShbjimdm47Y9AKmdCKEFcLFY276bPC0/ylEwI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKmq1/NbfJxY9azerRHraD6Ms66zdT3Vhy65H+iIjv0/4w/UyEl
	mGFMatLPF+DjxUAo8csHJfLwOnFJVdDHSqcnXM6eq45epB914X+0Un/icltfH+9LA9TuP3+GZXc
	FO9li3MNzQeBnTQOKf2Qnvnpo8l1oK54=
X-Gm-Gg: AYBFou0JGf22x4p1qcPKJ0u6zoF55pX1VKJ84JF6MDiGjFXpxVEorlQeibBqKXbvl5n
	1a6mgbRNW01A/vpbwjie1/ZFHZYLu0/JMvOqHteRFms+StWwPLl1UxkIFR2fqSt1VZGxYVwjNfE
	GwfSmjTJGSc59GwuCwxwsqG5b8lnx4KsvrxW+6p0DqPh8xXLL9KUoykKElIgU2FXdVj9PXA5kXn
	v142NstCRDpl7K2YKukWq1JsezXYpKw6PVcaCkL6ZFC4hYUhiMJlzQnt/CmAVncQ0YuRlKU0+Zl
	xwp8IG2Wmq71O1QWNn7TUiEDTBwucBqhghdFd5mykCeQC4ZtYuIxep6QU6zguN0RDOI0UkctLPg
	wkglbGpVQE0NBNmweN1BD8BUdoEJq3Mi2i7XA
X-Received: by 2002:a05:6512:12cd:b0:5ba:3579:3673 with SMTP id
 2adb3069b0e04-5bcdeae5cafmr9685403e87.5.1792118069385; Thu, 15 Oct 2026
 19:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6067ebd6-83a3-4ba5-86c9-a66c3348f8e4@linux.dev>
 <as802eClIH7MpxBR@inochi.infowork> <as-_ZlweuKWU1dsc@hiagonb>
In-Reply-To: <as-_ZlweuKWU1dsc@hiagonb>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 16 Oct 2026 10:34:16 +0800
X-Gm-Features: AclHuK9EEYctbKMmDXXdXJmjfty13dQIex6YCJPMRZz7hXCkT_DqX9VfUCWCwK8
Message-ID: <CAKspUhL1HMT14JZARuxnoh21+mH+7_9rJRggqu_s-t4_CZB8PA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hiago, Inochi, Chen,

On Wed, Oct 14, 2026 at 02:49:15PM -0300, Hiago De Franco wrote:
> On Wed, Oct 14, 2026 at 03:56:02PM +0800, Inochi Amaoto wrote:
> > Instead of taking this patch, I wonder whether it can be converted to a
> > generic DT overlay file for all the supported boards, so we won't needed
> > to merge many duplicated patch for it.
>
> thanks for the idea. I can think about that, but in this case the other
> overlay for 256M is already on linux-riscv/for-next, so after 7.4-rc1 is
> out I can think about merging both overlays into only one file.

Since the 256M overlay in for-next is mine, I can take the merge after
7.4-rc1, if that suits you.

Only the Duo and the Duo 256M would use it: the Duo S and the Huashan
Pi already enable gmac0 and mdio in their board files. Both labels come
from cv180x.dtsi, so the overlay itself has nothing board-specific in
it.

What I have in mind:

  1/2  turn sg2002-milkv-duo256m-eth.dtso into a shared cv18xx-eth.dtso
  2/2  compose the same overlay with cv1800b-milkv-duo.dtb

2/2 is your patch reduced to two Makefile lines, so I would rather it
stay yours, sent on top of 1/2 with your Duo test. If you would prefer
to do the whole thing yourself, that is fine too, and I will test it on
the Duo 256M.

On naming, I would like to settle it in this series while the 256M
overlay is still new. The overlay is named after what it enables, but
the composed DTB is really the board plus the IO board: the base DTS
already sets USB to host, which the IO board's hub needs. So I would
call the composed DTBs sg2002-milkv-duo256m-ioboard.dtb and
cv1800b-milkv-duo-ioboard.dtb.

The reason I care about this is my own setup. Besides the IO board, I
use the Duo 256M with Ethernet wired up without the IO board, together
with USB networking over the USB-C port. That works on the vendor BSP,
which uses OTG, but not on mainline: both boards are host-only today,
and the host setting in the 256M DTS came from my own board patch,
copied from the Duo.

Once the overlay is done, I plan to look at device mode on mainline.
If it works, the host setting could move into a usb-host overlay:

  <board>-ioboard.dtb = base + eth + usb-host
  <board>-eth.dtb     = base + eth

IO board users would then see no change. If the composed DTB kept the
-eth name instead, it would silently lose the IO board's USB ports when
the base changes, which is why I would rather rename now. That part
would be a separate series, of course.

I have both setups here, so please feel free to Cc me on Milk-V Duo
patches; I am glad to test.

Inochi, Chen, does that layout make sense to you, and any preference
on the names?

Thanks,
Chen-Yu
